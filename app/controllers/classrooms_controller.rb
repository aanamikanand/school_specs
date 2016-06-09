class ClassroomsController < ApplicationController
	before_action :school
	before_action :classroom, only: [:show, :edit, :update, :destroy]

  def index
  	@classroom = @school.classrooms
  end

  def show
  end

  def new
  	@classroom = Classroom.new
  end

  def create
  	@classroom = @school.classrooms.new(classroom_params)
  	if @classroom.save
  		flash[:success] = "Classroom Created!"
  		redirect_to school_classroom_path(@school, @classroom)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @classroom.update(classroom_params)
  		flash[:success] = "classroom Updated!"
  	redirect_to school_classroom_path(@school, @classroom)
  else
  	render :edit
  end
  end

  def destroy
  	@classroom.destroy
  	flash[:success] = "Classroom Destroyed!"
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
