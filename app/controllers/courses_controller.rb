class CoursesController < ApplicationController
  def index
    @school = get_school
    @courses = @school.courses.page params[:page]
  end

  def show
    @school = get_school
    @course = get_course
  end

  def new
    @school = get_school
    @course = Course.new
  end

  def create
    @school = get_school
    @course = @school.courses.build(course_params)
    if @course.save
      redirect_to school_courses_path
    else
      render :new
    end
  end

  def edit
    @school = get_school
    @course = get_course
  end

  def update
    @school = get_school
    @course = get_course
    if @course.update(course_params)
      redirect_to school_course_path(@school, @course)
    else
      render :edit
    end
  end

  def destroy
    @course = get_course
    if @course.destroy
      redirect_to school_courses_path
    else
      redirect_to (:back)
    end
    rescue ActiveRecord::InvalidForeignKey
      redirect_to (:back)

  end

  private

  def get_school
    School.find(params.fetch(:school_id))
  end

  def get_course
    Course.find(params.fetch(:id))
  end
  def course_params
    params.require(:course).permit(:name, :description)
  end
end
