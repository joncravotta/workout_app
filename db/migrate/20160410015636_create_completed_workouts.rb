class CreateCompletedWorkouts < ActiveRecord::Migration
  def change
    create_table :completed_workouts do |t|
      t.boolean :completed
      t.integer :user_id, :workout_id
      t.timestamps
    end
  end
end
