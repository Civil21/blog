class ArticlesController < ApplicationController
  before_action :article, only: %i[show edit update]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)

    if article.save
      redirect_to article

    else
      redirect_to articles_path
    end
  end

  def update
    article.update(article_params)
    redirect_to article
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :image, images: [])
  end
end
