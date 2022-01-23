class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update edit]
  before_action :article, only: %i[show edit update]

  def index
    @articles = Article.all
  end

  def show
    @comments = article.comments
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create

    @article = current_user.articles.build(article_params)

    if article.save
      redirect_to article

    else
      render "new"
    end
  end

  def update
    if article.update(article_params)
      redirect_to article
    else
      render "edit"
    end
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :image, :user_id, category_ids: [], images: [])
  end
end
