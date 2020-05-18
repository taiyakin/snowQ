class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader
end
