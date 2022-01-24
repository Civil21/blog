class Article < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :tags, dependent: :delete_all
  has_many :categories, through: :tags

  validates :title, length: {minimum: 5}
  validates :body, length: {minimum: 30}

  def category_names=(names)

    new_names = names.split(",").map{|name| name.downcase.strip}.uniq
    current_names = categories.map(&:name)
    old_names = current_names - new_names
    new_names = new_names - current_names

    old_category_ids = Category.where(name: old_names).ids
    tags.where(category_id: old_category_ids).delete_all if old_category_ids.present?

    new_names.each do |name|
      category = Category.find_or_create_by(name: name)
      categories << category
    end
  end

  def category_names
    categories.map(&:name).join(",")
  end

end
