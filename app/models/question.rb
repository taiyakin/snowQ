class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :text, presence: true

  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader
end
