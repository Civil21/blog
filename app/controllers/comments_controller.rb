class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @comment = current_user.comments.build(comment_paramas)
    @comment.article = article
    @comment.save

    redirect_to article
  end

  private

  def article
      Article.find(params[:article_id])
  end

  def comment_paramas
    params.require(:comment).permit(:text,:user_id,:article_id)
  end
end
