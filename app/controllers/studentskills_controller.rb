class StudentskillsController < ApplicationController
  before_action :set_studentskill, only: [:show, :edit, :update, :destroy]

  def index
    @studentskills = StudentSkill.all
    render :index
  end

  def one_studentskill
    @studentskill = StudentSkill.first
    render :show
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
    redirect_to studentskills_url, notice: "Student Skill was successfully destroyed."
  end

  private

  def set_studentskill
    @studentskill = StudentSkill.find(params[:id])
  end

  def studentskill_params
    params.require(:student_skill).permit(:student_id, :skill_id)
  end
end
