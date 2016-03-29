class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout_plan

  validates_uniqueness_of :user, scope: :workout_plan
end
