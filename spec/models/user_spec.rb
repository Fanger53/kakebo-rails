require 'rails_helper'

RSpec.describe User, type: :model do
  current_user = User.first_or_create!(username:'test1', email: 'dean@example.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    @user1 = User.new(username: 'test1')
  end
  context 'validation tests' do
    it ' ensures name not blank' do
      user = User.new(username: '').save
      expect(user).to eql(false)
    end
    it 'ensures length of username should at least 3' do
      user = User.new(username: 'c').save
      expect(user).to eql(false)
    end
    it 'creates a user only if the name is unique' do
      @user1.save
      @user2 = User.create(username: @user1.username.to_s)
      expect(@user2.valid?).to eq false
    end
  end
  
  describe "associations" do
    it " create user with valid attributes" do
      expect(current_user).to be_valid
    end
    it "invalid create user without username" do
      current_user.username = ''
      expect(current_user).not_to be_valid
    end
    
    
  end
  
end
