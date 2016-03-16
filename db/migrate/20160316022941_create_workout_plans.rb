class CreateWorkoutPlans < ActiveRecord::Migration
  def change
    create_table :workout_plans do |t|
      t.string :name
      t.string :description
      t.text :summary

      t.timestamps null: false
    end
  end
end
