require 'rails_helper'
require 'capybara/rails'

feature 'User creation and login' do
  scenario 'User can be created' do
    visit '/'
    expect(page).to have_content 'Welcome to the Messenger'
    click_on 'Create Account'

    fill_in 'Name', with: 'Test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123'
    click_on 'Sign Up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123'
    click_on 'Login'

    expect(page).to have_content 'Welcome, Test'

    click_on 'Logout'

    expect(page).to have_content 'Welcome to the Messenger'
    expect(page).to_not have_content 'Welcome, Test'
  end
end