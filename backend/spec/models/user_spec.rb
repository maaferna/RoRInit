# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a valid user' do
    user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
    expect(user).to be_valid
  end

  # Add more tests as needed
end

