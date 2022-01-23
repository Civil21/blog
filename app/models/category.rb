class Category < ApplicationRecord
  has_many :tags, dependent: :delete_all
  has_many :articles, through: :tags
end
