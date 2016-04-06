class Student < ActiveRecord::Base
  belongs_to :school
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :teachers, through: :courses

  validates :name, presence: true
end
