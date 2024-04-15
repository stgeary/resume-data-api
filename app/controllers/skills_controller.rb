class SkillsController < ApplicationController
  class ExperiencesController < ApplicationController
    before_action :set_student
    before_action :set_experience, only: [:show, :edit, :update, :destroy]

    def index
      @experiences = @student.all
      render :index
    end

    def create
      @skill = @student.create(
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
  end
end
