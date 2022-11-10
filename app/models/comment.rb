class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'
  belongs_to :post, foreign_key: 'postId'

  def update_comments_counter
    post = Post.find(postId)
    post.update(commentsCounter: Comment.where(postId: post.id).count)
  end
end
