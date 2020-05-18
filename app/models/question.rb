class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy

  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader
end
