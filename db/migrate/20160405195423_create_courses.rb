class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :description
      t.belongs_to :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
