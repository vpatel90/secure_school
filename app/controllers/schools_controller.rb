class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = get_school_by_id
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to school_path(@school.id)
    else
      render :new
    end
  end

  private
  def school_params
    params.require(:school).permit(:name, :motto)
  end

  def get_school_by_id
    School.find(params.fetch(:id))
  end
end
