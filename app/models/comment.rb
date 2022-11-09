class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'
  belongs_to :post, foreign_key: 'postId'

  def update_commentsCounter
    post = Post.find(self.postId)
    post.update(commentsCounter: Comment.where(postId: post.id).count)
  end
end