require 'rails_helper'
require 'capybara/rails'

feature 'Message creation' do
  before :each do
    @user = create_user
    @bob = create_user({name: 'Bob', email: 'bob@bob.com'})
    login(@user)
  end

  scenario 'User can create new conversation' do
    click_on 'Start a new conversation'
    fill_in 'message[body]', with: 'This is a test'
    click_on 'Send Message'

    expect(page).to have_content "From #{@user.name} This is a test"

    fill_in 'message[body]', with: 'This is another test'
    click_on 'Reply'

    expect(page).to have_content "From #{@user.name} This is a test" +
                                   " From #{@user.name} This is another test"

    click_on 'Logout'
    login(@bob)

    expect(page).to have_content 'Welcome, Bob'
    expect(page).to have_content "From #{@user.name} This is a test" +
                                   " From #{@user.name} This is another test"

  end
end