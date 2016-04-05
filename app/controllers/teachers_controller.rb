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
    @school = get_school
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

  def edit
    @school = get_school
    @teacher = get_teacher
  end

  def update
    @school = get_school
    @teacher = get_teacher
    if @teacher.update(teacher_params)
      redirect_to school_teacher_path(@school, @teacher)
    else
      render :edit
    end
  end

  def destroy
    @teacher = get_teacher
    if @teacher.destroy
      redirect_to school_teachers_path
    else
      redirect_to (:back)
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
