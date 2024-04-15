class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = Experience.all
    render :index
  end

  def show
  end

  def new
    @experience = Experience.new
  end

  def edit
  end

  # POST /experiences
  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to @experience, notice: 'Experience was successfully created.'
    else
      render :new
    end
  end

  def update
    if @experience.update(experience_params)
      redirect_to @experience, notice: 'Experience was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_url, notice: 'Experience was successfully destroyed.'
  end

  private

    def set_experience
      @experience = Experience.find(params[:id])
    end

    def experience_params
      params.require(:experience).permit(:start_date, :end_date, :job_title, :company_name, :details)
    end
end
