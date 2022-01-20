class AddCommentableToComment < ActiveRecord::Migration[6.1]
  def up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    Comment.find_each do |comment|
      comment.commentable_id = comment.article_id
      comment.commentable_type = "Article"
      comment.save
    end
    remove_column :comments, :article_id
  end

  def down
    add_column :comments, :article_id, :integer
    Comment.find_each do |comment|
      if comment.commentable_type == "Article"
        comment.article_id = comment.commentable_id
        comment.save
      else
        comment.delete
      end
    end
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end
end
