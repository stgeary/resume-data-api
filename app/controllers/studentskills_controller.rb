class StudentskillsController < ApplicationController
  before_action :set_studentskill, only: [:show, :create, :update, :destroy]
  before_action :autheticate_student, only: [:show, :create, :update, :destroy]

  def index
    @studentskills = StudentSkill.all
    render :index
  end

  def show
    @studentskill = StudentSkill.find_by(id: params[:id])
    render :show
  end

  def create
    @studentskill = StudentSkill.new(studentskill_params)
    if @studentskill.save
      redirect_to @studentskill, notice: "Student Skill was successfully created."
    else
      render :new
    end
  end

  def update
    if @studentskill.update(studentskill_params)
      redirect_to @studentskill, notice: "Student Skill was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @studentskill.destroy
    redirect_to @studentskill, notice: "Student Skill was successfully destroyed."
  end

  private

  def set_studentskill
    @studentskill = StudentSkill.find_by(params[:id])
  end

  def studentskill_params
    params.permit(:student_id, :skill_id)
  end
end
