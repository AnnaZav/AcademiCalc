# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'registration' do
    it 'render register form' do
      visit new_user_session_path
      expect(page.body).to include('Sign up')
    end

    it 'register new user and sign in' do
      visit new_user_registration_path

      fill_in :user_email, with: 'user@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Sign up'

      expect(page.body).to include('Subjects')
    end
  end

  describe 'page working' do

    it 'register new user and sign in' do
      visit new_user_registration_path

      fill_in :user_email, with: 'user@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Sign up'
      click_link 'Logout'
      visit new_user_session_path
      fill_in :user_email, with: 'user@gmail.com'
      fill_in :user_password, with: 'password'
      click_button 'Login'
      click_link 'Create new subject'

      expect(page.body).to include('Name')
    end
  end

  describe 'page not working' do

    it 'register new user and sign in' do
      visit new_user_registration_path

      fill_in :user_email, with: 'user@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Sign up'
      click_link 'Logout'

      expect(page.body).to include('You need to sign in or sign up before continuing.')
    end
  end
end
