class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'
  belongs_to :post, foreign_key: 'postId'
end