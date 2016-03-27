class AddUserToWorkoutPlans < ActiveRecord::Migration
  def change
    add_column :workout_plans, :user_id, :integer
  end
end
