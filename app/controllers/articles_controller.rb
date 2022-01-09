class ArticlesController < ApplicationController
  before_action :article, only: [:show]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if article.save
      redirect_to article

    else
      redirect_to articles_path
    end
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
