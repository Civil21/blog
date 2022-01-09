class PagesController < ApplicationController
  def index
    @articles = Article.limit(5)
  end

  def about; end
end
