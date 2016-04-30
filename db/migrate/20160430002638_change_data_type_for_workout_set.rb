class ChangeDataTypeForWorkoutSet < ActiveRecord::Migration
  def change
    change_column :workout_sets, :amount, :string
  end
end
