require 'spec_helper'

feature 'User' do
  scenario 'user can sign up' do

    visit new_user_registration_path
    fill_in 'user_user_name', with: "test_user1"
    fill_in 'user_email', with: "test1@test.com"
    fill_in 'user_password', with: "test1234"
    fill_in 'user_password_confirmation', with: "test1234"
    click_button 'Sign up'

    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

  scenario 'unauthenticated people can not view todos' do
    visit todos_path
    expect(page).to have_no_content('Todo List')
  end
end
