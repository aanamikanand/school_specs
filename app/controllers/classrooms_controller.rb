class ClassroomsController < ApplicationController
	before_action :school
  before_action :classroom, only: [:show, :edit, :update, :destroy]

  def index
  	@classrooms = @school.classrooms
  end

  def show
  end

  def new
  	@classroom = Classroom.new
  end

  def create
  	if @classroom = @school.classrooms.create(classroom_params)
  		redirect_to school_classrooms_path(@classroom)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @classroom.update(classroom_params)
  	redirect_to school_classroom_path(@school, @classroom)
  else
  	render :edit
  end
  end

  def destroy
  	@classroom.destroy
  	redirect_to school_classrooms_path(@school)
  end

  private

  def classroom
  	@classroom = @school.classrooms.find(params[:id])
  end

  def classroom_params
  	params.require(:classroom).permit(:name, :code, :active)
  end

  def school
    @school = School.find(params[:school_id])
  end
end
