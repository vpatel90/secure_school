class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :concentrations

  validates :name, presence: true
end
