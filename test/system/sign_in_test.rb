require "application_system_test_case"

class SignInTest < ApplicationSystemTestCase

  test 'sign up a new user' do
    visit new_user_registration_path
    fill_in 'Name', with: 'New User'
    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign up'
    
    assert_text 'Hi, New User'
  end
end
