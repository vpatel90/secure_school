class HomeController < ApplicationController
  def dashboard
    @last_student = Student.last
    @top_schools = School.order(students_count: :desc).limit(10)
  end
end
