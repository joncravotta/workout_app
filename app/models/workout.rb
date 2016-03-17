class Workout < ActiveRecord::Base
  belongs_to :workout_plan
  has_many :workout_sets
end
