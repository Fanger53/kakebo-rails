require 'rails_helper'

RSpec.describe Group, type: :model do
  current_user = User.first_or_create!(username:'test1', email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  let(:group) { current_user.groups.create(name: 'things') }
  context 'testing group controller method and models' do
    it 'expects a new group to created successfuly' do
      expect(group.valid?).to eq(true)
    end
    it "doesn't create a group with an empty name" do
      group = Group.create(name: '')
      expect(group.valid?).to eq false
    end
    it 'creates a group only if the name is unique' do
      grouptest = Group.create(name: group.name.to_s)
      expect(grouptest.valid?).to eq false
    end
    
  end
end
