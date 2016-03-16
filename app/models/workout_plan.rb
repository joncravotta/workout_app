class WorkoutPlan < ActiveRecord::Base
  has_many :workouts
end
