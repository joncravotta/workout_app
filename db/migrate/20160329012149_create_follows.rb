class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.boolean :follow
      t.integer :user_id, :workout_plan_id
      t.timestamps
    end
  end
end
