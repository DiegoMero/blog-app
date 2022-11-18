class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  private

  def update_posts_counter
    user = User.find(authorId)
    user.update(postsCounter: Post.where(authorId: user.id).count)
  end

  def five_most_recent_comments
    Comment.where(postId: id).last(5)
  end
end
