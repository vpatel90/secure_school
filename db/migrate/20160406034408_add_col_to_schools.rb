class AddColToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :student_count, :integer, default: 0
  end
end
