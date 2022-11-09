class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'
  has_many :likes
  has_many :comments
end