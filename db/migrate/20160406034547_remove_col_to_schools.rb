class RemoveColToSchools < ActiveRecord::Migration
  def change
    remove_column :schools, :student_count, :integer
    add_column :schools, :students_count, :integer, default: 0
  end
end
