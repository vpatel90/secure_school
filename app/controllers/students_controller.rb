class StudentsController < ApplicationController
  def index
    @school = get_school
    @students = @school.students
  end

  def show
    @school = get_school
    @student = get_student
  end

  def new
    @school = get_school
    @student = Student.new
  end

  def create
    @school = get_school
    @student = @school.students.build(student_params)
    if @student.save
      redirect_to school_students_path
    else
      render :new
    end
  end

  def edit
    @school = get_school
    @student = get_student
  end

  def update
    @school = get_school
    @student = get_student
    if @student.update(student_params)
      redirect_to school_student_path(@school, @student)
    else
      render :edit
    end
  end

  def destroy
    @student = get_student
    if @student.destroy
      redirect_to school_students_path
    else
      redirect_to (:back)
    end
  end

  private

  def get_school
    School.find(params.fetch(:school_id))
  end

  def get_student
    Student.find(params.fetch(:id))
  end
  def student_params
    params.require(:student).permit(:name)
  end
end
