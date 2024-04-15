class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  def index
    @educations = Education.where(student_id: current_user.id)
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
    @education.student_id = current_user.id

    if @education.save
      redirect_to @education, notice: 'Education was successfully created.'
    else
      render :new
    end
  end

  def update
    if @education.update(education_params.merge(student_id: current_user.id))
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
      @education = Education.find_by(id: params[:id], student_id: current_user.id)
    end

    def education_params
      params.require(:education).permit(:start_date, :end_date, :degree, :university_name, :details)
    end
end
