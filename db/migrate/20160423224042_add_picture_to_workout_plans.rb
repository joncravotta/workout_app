class AddPictureToWorkoutPlans < ActiveRecord::Migration
  def change
    add_column :workout_plans, :picture, :string
  end
end
