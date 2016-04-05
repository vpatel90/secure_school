class Course < ActiveRecord::Base
  belongs_to :school
  has_many :concentrations
  has_many :enrollments
end
