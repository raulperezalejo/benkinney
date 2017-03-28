require "rails_helper"

feature "Post" do

  before do
    create(:user)
    visit '/'
    fill_in 'user_email', :with => "test@test.com"
    fill_in "user_password", :with => "test123"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "creating a new post" do
    click_link 'New Post'
    fill_in 'post_title', :with => "Test"
    fill_in "post_body", :with => "Test"
    click_button "Create Post"
    expect(page).to have_content("Post was successfully created.")
  end

end