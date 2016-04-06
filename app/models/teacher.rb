class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :concentrations
  has_many :courses, through: :concentrations
  has_many :students, through: :courses, source: :enrollments

  validates :name, presence: true

  def school_id
    school.id
  end
end
