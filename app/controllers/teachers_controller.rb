class TeachersController < ApplicationController
  def index
    @school = get_school
    @teachers = @school.teachers
  end

  def show
    @school = get_school
    @teacher = get_teacher
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @school = get_school
    @teacher = @school.teachers.build(teacher_params)
    if @teacher.save
      redirect_to school_teachers_path
    else
      render :new
    end
  end

  private

  def get_school
    School.find(params.fetch(:school_id))
  end

  def get_teacher
    Teacher.find(params.fetch(:id))
  end
  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
