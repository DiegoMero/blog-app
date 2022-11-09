class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'
  belongs_to :post, foreign_key: 'postId'

  def update_likes_counter
    post = Post.find(postId)
    post.update(likesCounter: Like.where(postId: post.id).count)
  end
end
