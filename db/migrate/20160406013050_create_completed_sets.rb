class CreateCompletedSets < ActiveRecord::Migration
  def change
    create_table :completed_sets do |t|
      t.boolean :completed
      t.integer :user_id, :workout_set_id
      t.timestamps
    end
  end
end
