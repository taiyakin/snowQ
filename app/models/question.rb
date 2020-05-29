class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy

  def self.search(search)
    if search
      Question.where('text LIKE(?)', "%#{search}%").order(created_at: :desc)
    else
      Question.all.order(created_at: :desc)
    end
  end

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :text, presence: true

  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader
end
