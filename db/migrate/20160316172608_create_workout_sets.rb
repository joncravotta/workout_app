class CreateWorkoutSets < ActiveRecord::Migration
  def change
    create_table :workout_sets do |t|
      t.string :name
      t.string :rep_type
      t.text :description
      t.integer :amount
      t.references :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
