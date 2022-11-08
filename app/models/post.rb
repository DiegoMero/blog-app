class Post < ApplicationRecord
  belongs_to :users, foreign_key: "authorId"
  has_many :likes
  has_many :comments
end