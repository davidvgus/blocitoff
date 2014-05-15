require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'Product manager creates TODO' do
  scenario 'Successfully' do

    user = FactoryGirl.create(:user, :user_name => "dave")
    login_as(user, :scope => :user)

    visit new_todo_path
    fill_in 'Desc', with: "Meet up with the team."
    click_button 'Save'
    assert page.has_content?('Your new TODO was saved')

    assert page.has_content?('Meet up with the team')

    Warden.test_reset!
  end

  scenario 'With description missing' do
    user = FactoryGirl.create(:user, :user_name => "dave")
    login_as(user, :scope => :user)

    visit new_todo_path
    fill_in 'Desc', with: ""
    click_button 'Save'
    expect(page).to have_content('Description may not be blank')

    Warden.test_reset!
  end

end

