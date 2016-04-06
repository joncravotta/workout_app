class CompletedSet < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout_set
end
