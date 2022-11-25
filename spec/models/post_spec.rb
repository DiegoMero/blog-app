# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   subject { Post.new(title: 'Hello!', text: 'Nice blog', commentsCounter: 3, likesCounter: 2) }

#   before { subject.save }

#   it 'title should be present' do
#     subject.title = nil
#     expect(subject).to_not be_valid
#   end

#   it 'title should not be too long' do
#     subject.title = 'a' * 251
#     expect(subject).to_not be_valid
#   end

#   it 'commentsCounter should be a valid value' do
#     subject.commentsCounter = -1
#     expect(subject).to_not be_valid
#   end

#   it 'likesCounter should be a valid value' do
#     subject.likesCounter = -1
#     expect(subject).to_not be_valid
#   end

#   it 'should return the last 5 comments from a post when we call five_most_recent_comments method' do
#     result = subject.five_most_recent_comments
#     expect(result).to eq []
#   end
# end
