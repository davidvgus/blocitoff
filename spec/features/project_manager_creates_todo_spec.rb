require 'spec_helper'

feature 'Product manager creates TODO' do
  scenario 'Successfully' do
    visit new_todo_path
    fill_in 'Desc', with: "Meet up with the team."
    click_button 'Save'
    #expect( page ).to have_content('Your new TODO was saved')
    assert page.has_content?('Your new TODO was saved')

    #expect( page ).to have_content('Meet up with the team')
    assert page.has_content?('Meet up with the team')
  end

  scenario 'With description missing' do
    visit new_todo_path
    fill_in 'Desc', with: ""
    click_button 'Save'
    assert page.has_content?('Description may not be blank')
  end

  scenario 'user can sign up' do

  end
end
