# require 'rails_helper'

# RSpec.describe 'UsersControllers', type: :request do
#   it 'should return a positive response status' do
#     get '/users'
#     expect(response).to have_http_status(:ok)
#   end

#   describe 'GET users#index' do
#     subject { get '/users' }

#     it 'should renders the index template' do
#       expect(subject).to render_template(:index)
#       expect(subject).to render_template('index')
#       expect(subject).to render_template('users/index')
#     end
#   end

#   describe 'GET users#show' do
#     subject { get '/users/1' }

#     it 'should renders the show template' do
#       expect(subject).to render_template(:show)
#       expect(subject).to render_template('show')
#       expect(subject).to render_template('users/show')
#     end
#   end

#   it 'should include the correct placeholder text' do
#     get '/users'
#     expect(response.body).to include('Here is a list of users')
#   end

#   it 'should include the correct placeholder text' do
#     get '/users/1'
#     expect(response.body).to include('Here is the information about a specific user')
#   end
# end
