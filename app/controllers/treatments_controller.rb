class TreatmentsController < ApplicationController

  def edit
    load_study
    load_treatment
  end

  def create
    build_treatment

    if @treatment.save
      flash[:notice] = "Treatment Successfully Created"
      flash[:error] = nil
      redirect_to study_path(@study)
    else
      flash[:error] = "Unable to Save Treatment. Please ensure fields are filled properly"
      redirect_to study_path(@study)
    end
  end

  def update
    load_treatment
    load_study
    build_treatment
    if @treatment.save
      flash[:notice] = "Treatment Successfully Updated"
      flash[:error] = nil
      redirect_to study_path(@study)
    else
      flash[:error] = "Please review the problems below"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    load_treatment
    if @treatment.destroy
      flash[:notice] = "Treatment Successfully Deleted"
      flash[:error] = nil
      redirect_to study_path(@study)
    else
      flash[:error] = "Something Went Wrong"
      redirect_to study_path(@study)
    end
  end

  private

  def load_study
    @study ||= Study.find(params[:study_id])
  end

  def load_treatment
    @treatment ||= Treatment.find(params[:id])
  end

  def build_treatment
    @treatment ||= load_study.treatments.new
    @treatment.attributes = treatment_params
  end

  def treatment_params
    if params[:treatment]
      params.require(:treatment).
        permit( :description,
               :effect_size,
               :standard_error)
    else
      {}
    end
  end
end
