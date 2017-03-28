require "rails_helper"

feature "Accounts" do
  scenario "creating an account" do
    visit root_path
    click_link 'Sign up'
    fill_in "First name", :with => "Test"
    fill_in "Last name", :with => "Test"
    fill_in "Email", :with => "test@test.com"
    fill_in "Password", :with => "test1234"
    fill_in "Password confirmation", :with => "test1234"
    click_button "Sign Up"
    success_message = "Welcome! You have signed up successfully."
    expect(page).to have_content(success_message)
  end
end