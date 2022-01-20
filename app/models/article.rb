class Article < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, length: {minimum: 5}
  validates :body, length: {minimum: 30}

end
