class WorkoutPlan < ActiveRecord::Base
  has_many :workouts
  belongs_to :user
  has_many :follows, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'Picture should be lass than 5MB')
    end
  end
end
