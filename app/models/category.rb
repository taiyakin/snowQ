class Category < ApplicationRecord
  has_many :questions

  validates :genre,  presence: true
end
