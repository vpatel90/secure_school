class CreateConcentrations < ActiveRecord::Migration
  def change
    create_table :concentrations do |t|
      t.belongs_to :teacher, index: true, foreign_key: true
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
