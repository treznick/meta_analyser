class MetaAnalysesController < ApplicationController
  def index
    flash[:error] = nil
    load_meta_analyses
  end

  def new
    build_meta_analysis
  end

  def edit
    load_meta_analysis
  end

  def create
    build_meta_analysis

    if @meta_analysis.save
      flash[:notice] = "Meta Analysis Successfully Created"
      redirect_to action: 'index'
    else
      flash[:error] = "Please review the problems below"
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    load_meta_analysis
    build_meta_analysis
    if @meta_analysis.save(meta_analysis_params)
      flash[:notice] = "Meta Analysis Successfully Updated"
      redirect_to action: 'index'
    else
      flash[:error] = "Please review the problems below"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    load_meta_analysis
    if @meta_analysis.destroy
      flash[:notice] = "Meta Analysis Successfully Deleted"
      redirect_to action: 'index'
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def load_meta_analyses
    @meta_analyses ||= MetaAnalysis.all
  end

  def load_meta_analysis
    @meta_analysis ||= MetaAnalysis.find(params[:id])
  end

  def build_meta_analysis
    @meta_analysis ||= MetaAnalysis.new
    @meta_analysis.attributes = meta_analysis_params
  end

  def meta_analysis_params
    if params[:meta_analysis]
      params.require(:meta_analysis).
        permit(:description)
    else
      {}
    end
  end
end
