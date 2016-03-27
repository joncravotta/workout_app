class WorkoutPlan < ActiveRecord::Base
  has_many :workouts
  belongs_to :user
end
