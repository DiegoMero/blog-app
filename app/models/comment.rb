class Comment < ApplicationRecord
  belongs_to :users, foreign_key: "authorId"
  belongs_to :posts, foreign_key: "postId"
end