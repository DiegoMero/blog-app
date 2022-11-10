require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Diegolo', photo: 'link', bio: 'Nice guy', postsCounter: 5) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should be greater or equal than zero' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'should return the last 3 posts from this user when we call three_most_recent_posts method' do
    result = subject.three_most_recent_posts
    expect(result).to eq []
  end
end
