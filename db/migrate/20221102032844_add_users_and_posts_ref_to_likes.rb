class AddUsersAndPostsRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, null: false, foreign_key: true
    add_reference :likes, :posts, null: false, foreign_key: true
  end
end
