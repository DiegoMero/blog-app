require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index page' do

    before :each do
      @user = User.create(name: 'Tom', bio: 'Teacher from Mexico.', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', postsCounter: 0)
      visit '/users'
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

    it 'redirect to the users page when click' do
      click_on(@user.name)
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
