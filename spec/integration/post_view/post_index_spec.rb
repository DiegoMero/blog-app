require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          postsCounter: 1)
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
      visit "/users/#{@user.id}/posts"
    end

    it 'shows the name of Tom' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the pic' do
      expect(page).to have_content(@user.photo)
    end

    it 'shows the number of posts' do
      expect(page).to have_content("Number of posts: #{@user.postsCounter}")
    end

    it 'shows the post title' do
      expect(page).to have_content(@post.title)
    end

    it 'shows some of the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'shows the first comments of a post' do
      @comments = @post.five_most_recent_comments
      @comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    it 'shows the number of comments of a post' do
      expect(page).to have_content(@post.commentsCounter)
    end

    it 'shows how many likes a post have' do
      expect(page).to have_content(@post.likesCounter)
    end

    it 'show a section of pagination' do
      expect(page).to have_content('Pagination')
    end

    it 'redirect to the posts show page when click' do
      click_on(@post.text)
      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post.id}")
    end
  end
end
