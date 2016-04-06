class Concentration < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :course

  validates :teacher_id, uniqueness: {
    scope: :course_id,
    message: "Teacher can only sign up for a course once"
  }
end
