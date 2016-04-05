class Student < ActiveRecord::Base
  belongs_to :school
  has_many :enrollments

  validates :name, presence: true
end
