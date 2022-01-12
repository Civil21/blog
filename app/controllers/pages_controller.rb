class PagesController < ApplicationController
  def index
    @articles = Article.limit(10)
  end

  def about; end
end
