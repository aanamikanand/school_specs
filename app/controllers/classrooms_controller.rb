class ClassroomsController < ApplicationController
	before_action :classroom, only: [:show, :edit, :update, :destroy]

  def index
  	@classrooms = Classroom.all
  end

  def show
  end

  def new
  	@classroom = Classroom.new
  end

  def create
  	if @classroom = Classroom.create(classroom_params)
  		flash[:success] = "Classroom Created!"
  		redirect_to classroom_path(@classroom)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @classroom.update(classroom_params)
  	redirect_to classroom_path(@classroom)
  else
  	render :edit
  end
  end

  def destroy
  	@classroom.destroy
  	redirect_to classrooms_path
  end

  private

  def classroom
  	@classroom =Classroom.find(params[:id])
  end

  def classroom_params
  	params.require(:classroom).permit(:name, :code, :active)
  end
end
