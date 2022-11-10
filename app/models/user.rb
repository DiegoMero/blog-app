class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def three_most_recent_posts
    Post.where(authorId: id).last(3)
  end

  
end
