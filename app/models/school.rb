class School < ActiveRecord::Base
  has_many :teachers
  has_many :students
  has_many :courses
end
