require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  it 'should return a positive response status' do
    get '/users/1/posts'
    expect(response).to have_http_status(:ok)
  end

  describe 'GET posts#index' do
    subject { get '/users/1/posts' }

    it 'should renders the index template' do
      expect(subject).to render_template(:index)
      expect(subject).to render_template('index')
      expect(subject).to render_template('posts/index')
    end
  end

  describe 'GET posts#show' do
    subject { get '/users/1/posts/1' }

    it 'should renders the show template' do
      expect(subject).to render_template(:show)
      expect(subject).to render_template('show')
      expect(subject).to render_template('posts/show')
    end
  end

  it 'should include the correct placeholder text' do
    get '/users/1/posts'
    expect(response.body).to include('Here is a list of posts for a specific user')
  end

  it 'should include the correct placeholder text' do
    get '/users/1/posts/1'
    expect(response.body).to include('Here is the information about a specific post')
  end
end
