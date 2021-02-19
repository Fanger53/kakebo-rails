require 'rails_helper'

RSpec.describe Transfer, type: :model do
  current_user = User.first_or_create!(username: 'test1', email: 'dean@example.com', password: 'password',
                                       password_confirmation: 'password')
  transfer = Transfer.new(name: 'perros', amount: 500, user: current_user, group_id: 1)

  context 'testing the validations' do
    it 'validate amount be a integer' do
      expect(transfer.amount).to be_a(Integer)
    end
    it "doesn't create a transfer with an empty name" do
      transfer = Transfer.create(name: '')
      expect(transfer.valid?).to eq false
    end

    context 'tests for the controllers' do
      it 'test controller new' do
        transfer = Transfer.new(
          name: 'perros',
          amount: 500,
          user: current_user
        )
        expect(transfer.save).to eq(true)
      end
    end
  end
end
