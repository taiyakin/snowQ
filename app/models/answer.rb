class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :likes

  validates :text,  presence: true

  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader
end
