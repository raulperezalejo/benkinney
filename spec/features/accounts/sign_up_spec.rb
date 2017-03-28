require "rails_helper"

feature "Accounts" do
  scenario "creating an account" do
    visit '/users/sign_up'
    fill_in 'user_first_name', :with => "Test"
    fill_in "user_last_name", :with => "Test"
    fill_in "Email", :with => "test@test.com"
    fill_in "Password", :with => "test1234"
    fill_in "Password confirmation", :with => "test1234"
    # byebug
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end