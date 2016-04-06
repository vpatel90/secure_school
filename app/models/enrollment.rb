class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course


  validates :student_id, uniqueness: {
    scope: :course_id,
    message: "Student can only sign up for a course once"
  }

  def student_name
    student.name
  end

  def course_name
    course.name
  end
end
