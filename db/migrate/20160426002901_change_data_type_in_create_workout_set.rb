class ChangeDataTypeInCreateWorkoutSet < ActiveRecord::Migration
  def change
    change_column :workout_sets, :amount, :decimal
  end
end
