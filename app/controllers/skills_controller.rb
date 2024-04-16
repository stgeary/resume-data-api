class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :create, :update, :destroy]

  def index
    @skills = Skill.all
    render :index
  end

  def show
    @skill = Skill.find_by(id: params["id"])
    render :show
  end

  def create
    @skill = Skill.create(
      skill_name: params["skill_name"],
    )

    if @skill.save
      render :show
    else
      render json: { errors: @skill.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @skill = Skill.find_by(id: params["id"])
    @skill.update(
      skill_name: params["skill_name"],
    )
    render :show
  end

  def destroy
    @skill = Skill.find_by(id: params["id"])
    @skill.destroy
    render json: { message: "data successfully destroyed" }
  end

  private

  def set_skill
    @skill = Skill.find_by(id: params[:id])
  end

  def skill_params
    params.require(:skill).permit(:skill_name)
  end
end
