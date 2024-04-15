class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  def index
    @students = Student.all
    render :index
  end

  def one_student
    @student = Student.first
    render :show
  end

  def show
    @student = Student.find_by(id: params[:id])
    render :show
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "Student was successfully created."
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Student was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: "Student was successfully destroyed."
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :phone_number, :short_bio, :linkedin_url, :twitter_handle, :personal_url, :resume_url, :github_url, :photo, :password_digest)
  end
end
