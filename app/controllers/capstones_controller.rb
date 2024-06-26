class CapstonesController < ApplicationController
  before_action :set_capstone, only: [:show, :update, :destroy]
  before_action :authenticate_student, only: [ :update, :destroy, :new, :create]


  def index
    @capstones = Capstone.all
    render :index
  end


  def show
  end


  def new
    @capstone = Capstone.new
  end



  def create
    @capstone = Capstone.new(capstone_params)
    @capstone.student_id = current_student.id

    if @capstone.save
      redirect_to @capstone, notice: 'Capstone was successfully created.'
    else
      render :new
    end
  end


  def update
    if @capstone.update(capstone_params.merge(student_id: current_student.id))
      redirect_to @capstone, notice: 'Capstone was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @capstone.destroy
    redirect_to capstones_url, notice: 'Capstone was successfully destroyed.'
  end

  private

    def set_capstone
      @capstone = Capstone.find_by(id: params[:id], student_id: current_student.id)
    end

    def capstone_params
      params.require(:capstone).permit(:name, :description, :url, :screenshot)
    end

end
