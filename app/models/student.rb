class Student < ActiveRecord::Base
  belongs_to :school, counter_cache: true
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :teachers, through: :courses, source: :concentrations


  validates :name, presence: true
end
