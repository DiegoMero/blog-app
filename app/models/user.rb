class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: true
  validates :postsCounter, numericality: { greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    Post.includes(:author).where(authorId: id).last(3)
  end
end
