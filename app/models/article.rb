class Article < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  belongs_to :user
  has_many :comments
end
