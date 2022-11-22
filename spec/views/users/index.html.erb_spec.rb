require 'rails_helper'

RSpec.describe 'User index page', type: :system do
  describe 'index page' do
    it 'shows the index page' do
      @user = User.create(name: 'David', bio: 'Teacher from ENgland', photo: 'www.photo.com')
      visit users_index
    end

    it 'shows the username' do
      expect(page).to have_content(@user.name)
    end
  end
end