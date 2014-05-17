require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature 'User' do
  scenario 'can sign up' do

    visit new_user_registration_path
    fill_in 'user_user_name', with: "test_user1"
    fill_in 'user_email', with: "test1@test.com"
    fill_in 'user_password', with: "test1234"
    fill_in 'user_password_confirmation', with: "test1234"
    click_button 'Sign up'

    expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
  end

  scenario 'can not view todos if unauthorized' do
    visit todos_path
    expect(page).to have_no_content('Todo List')
  end

  scenario 'can log in' do
    user = FactoryGirl.build(:user,
                             email: "test@test.com",
                             password: "password123",
                             password_confirmation: "password123")
    user.confirmed_at = Time.now
    user.save!

    visit new_user_session_path
    fill_in 'user_email', with: "test@test.com"
    fill_in 'user_password', with: "password123"
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')

    Warden.test_reset!
  end

  scenario 'can sign out' do
    user = FactoryGirl.build(:user)
    user.confirmed_at = Time.now
    user.save!
    login_as(user, :scope => :user)

    visit todos_path

    click_link 'Sign out'
    expect(page).to have_content("Welcome to Todos please sign up or log in.")

    Warden.test_reset!
  end

  scenario 'First sees welcome page' do
    visit root_path
    expect(page).to have_content("Welcome to Todos please sign up or log in.")
  end
end

