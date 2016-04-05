class Course < ActiveRecord::Base
  belongs_to :school
  has_many :concentrations
  has_many :enrollments

  validates :name, presence: true
  validates :description, presence: true
end
