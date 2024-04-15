class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  def index
    @educations = Education.all
    render :index
  end


  def show
  end


  def new
    @education = Education.new
  end


  def edit
  end


  def create
    @education = Education.new(education_params)
    if @education.save
      redirect_to @education, notice: 'Education was successfully created.'
    else
      render :new
    end
  end


  def update
    if @education.update(education_params)
      redirect_to @education, notice: 'Education was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @education.destroy
    redirect_to educations_url, notice: 'Education was successfully destroyed.'
  end

  private

    def set_education
      @education = Education.find(params[:id])
    end


    def education_params
      params.require(:education).permit(:start_date, :end_date, :degree, :university_name, :details)
    end
end
