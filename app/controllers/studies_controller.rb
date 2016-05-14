class StudiesController < ApplicationController
  def index
    load_studies
  end

  def show
    load_study
    @treatment = @study.treatments.new
    load_treatments
  end

  def new
    build_study
  end

  def edit
    load_study
  end

  def create
    build_study

    if @study.save
      flash[:notice] = "Study Successfully Created"
      flash[:error] = nil
      redirect_to action: 'index'
    else
      flash[:error] = "Please review the problems below"
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    load_study
    build_study
    if @study.save
      flash[:notice] = "Study Successfully Updated"
      flash[:error] = nil
      redirect_to action: 'index'
    else
      flash[:error] = "Please review the problems below"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    load_study
    if @study.destroy
      flash[:notice] = "Study Successfully Deleted"
      flash[:error] = nil
      redirect_to action: 'index'
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def load_treatments
    @treatments ||= Treatment.where(study: @study)
  end

  def load_studies
    @studies ||= Study.all
  end

  def load_study
    @study ||= Study.find(params[:id])
  end

  def build_study
    @study ||= Study.new
    @study.attributes = deal_with_nested_params(study_params)
  end

  def deal_with_nested_params(params)
    if params['treatments_attributes']
      sub_params_with_numeric_keys = params['treatments_attributes']
      params['treatments_attributes'] = sub_params_with_numeric_keys.values
    end
    params
  end

  def study_params
    if params[:study]
      params.require(:study).
        permit(:name,
               :authors,
               :year,
               treatments_attributes: [:id,
                                       :description,
                                       :effect_size,
                                       :standard_error,
                                       :_destroy])
    else
      {}
    end
  end
end
