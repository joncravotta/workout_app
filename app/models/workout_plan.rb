class WorkoutPlan < ActiveRecord::Base
  has_many :workouts
  belongs_to :user
  has_many :follows, dependent: :destroy
  mount_uploader :picture, PictureUploader
end
