class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'
  has_many :likes
  has_many :comments

  def update_posts_counter
    user = User.find(authorId)
    user.update(postsCounter: Post.where(authorId: user.id).count)
  end

  def five_most_recent_comments
    Comment.where(postId: id).last(5)
  end
end
