require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'show page' do
    before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          postsCounter: 1)
      @user2 = User.create(name: 'Lilly',
                           bio: 'Teacher from Poland.',
                           photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           postsCounter: 0)
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    end

    it 'shows the post title' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@post.title)
    end

    it 'shows who wrote the post' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@user.name)
    end

    it 'shows how many comments it has' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@post.commentsCounter)
    end

    it 'shows how many likes it has' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@post.likesCounter)
    end

    it 'shows the post body' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content(@post.text)
    end

    it 'shows the username of each comment' do
      Comment.create(author: @user2, post: @post, text: 'Hi Tom!')
      @post.update(commentsCounter: 1)
      @comments = Comment.where(postId: @post.id)
      visit "/users/#{@user.id}/posts/#{@post.id}"
      @comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    it 'shows the comment of each username' do
      Comment.create(author: @user2, post: @post, text: 'Hi Tom!')
      @post.update(commentsCounter: 1)
      @comments = Comment.where(postId: @post.id)
      visit "/users/#{@user.id}/posts/#{@post.id}"
      @comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
