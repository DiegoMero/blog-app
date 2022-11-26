class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments
  has_many :posts
  has_many :likes

  validates :postsCounter, numericality: { greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    Post.includes(:author).where(authorId: id).last(3)
  end
end
