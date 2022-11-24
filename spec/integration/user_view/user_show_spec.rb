require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'show page' do

    before :each do
      @user = User.create(name: 'Tom', bio: 'Teacher from Mexico.', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', postsCounter: 0)
      visit "/users/#{@user.id}"
    end

    it 'shows the pic' do
      expect(page).to have_content(@user.photo)
    end

    it 'shows the name of Tom' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the number of posts' do
      expect(page).to have_content("Number of posts: #{@user.postsCounter}")
    end

    it 'shows the users bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'shows users first 3 posts' do
      @post = @user.three_most_recent_posts
      @post.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'shows the see all post button' do
      expect(page).to have_content('See all posts')
    end

    it 'redirects to user posts index when cliked' do
      click_link('See all posts')
      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end
  end
end
