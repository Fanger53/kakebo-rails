require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'create a new user' do
    scenario 'should be succesful' do
      visit new_user_registration_path
      within 'form' do
        fill_in 'user_username', with: 'test12'
        fill_in 'user_email',	with: 'fag1test@g.com'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'should be fail' do
      visit new_user_registration_path
      within 'form' do
        fill_in 'user_email',	with: 'fag1test@g.com'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation',	with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Username is too short')
    end
  end
end
