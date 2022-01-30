class PagesController < ApplicationController
  def index
    @articles = Article.limit(10).with_attached_image.includes(:user,:categories)

  end

  def about; end
end
