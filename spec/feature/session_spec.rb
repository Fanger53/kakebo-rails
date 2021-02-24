require 'rails_helper'

RSpec.describe User, type: :features do
  context 'create new user' do
    it 'should go to the log in' do
      visit '/users/sign_up'
      within('form') do
        fill_in 'user_name', with: 'Brian'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'
      end
      find_link('Log in').click
      expect(page).to have_content('Log in')
    end
    it 'should go to sign in page ' do
      visit 'users/sign_up'
      expect(page).to have_content('Sign up')
    end
  end

  context 'create new user fails' do
    it 'should be fail the create' do
      visit '/users/sign_up'
      within('form') do
        fill_in 'user_name', with: 'Brian'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Please review the problems below:')
    end
    it 'should fail if clicks a link without sign in' do
      visit '/users/sign_up'
      find_link('Home').click
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
    it 'should fail if clicks a link without sign in' do
      visit '/users/sign_up'
      find_link('MOTOcrazy!!').click
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  context 'sign in' do
    it 'should go to the sign up page' do
      visit '/users/sign_in'
      find_link('Sign up').click
      expect(page).to have_content('Sign up')
    end
    it 'should go to sign in page ' do
      visit 'users/sign_in'
      expect(page).to have_content('Log in')
    end
    it 'should go to sign in page ' do
      visit 'users/sign_in'
      expect(page).to have_content('Forgot your password?')
    end
  end

  context 'sign in fail' do
    it 'should be fail the create' do
      visit '/users/sign_in'
      within('form') do
        fill_in 'user_email', with: 'brian@gmail.com'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
    it 'should fail if clicks a link without sign in' do
      visit '/users/sign_in'
      find_link('Home').click
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
    it 'should fail if clicks a link without sign in' do
      visit '/users/sign_in'
      find_link('MOTOcrazy!!').click
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  context 'link log in ' do
    it 'should go to log in  page ' do
      visit '/users/sign_in'
      click_link('login', href: '/users/sign_in')
      expect(page).to have_content('Log in')
    end
    it 'should go to log in  page ' do
      visit '/users/sign_up'
      click_link('login', href: '/users/sign_in')
      expect(page).to have_content('Log in')
    end
  end

  context 'link sign in  ' do
    it 'should go to sign up page ' do
      visit '/users/sign_in'
      click_link('register', href: '/users/sign_up')
      expect(page).to have_content('Sign up')
    end
    it 'should go to sign up page ' do
      visit '/users/sign_up'
      click_link('register', href: '/users/sign_up')
      expect(page).to have_content('Sign up')
    end
  end
end