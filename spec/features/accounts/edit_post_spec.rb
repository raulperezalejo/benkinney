require "rails_helper"

feature "Post" do

  before do
    create(:user)
    visit '/'
    fill_in 'user_email', :with => "test@test.com"
    fill_in "user_password", :with => "test123"
    click_button "Log in"
    success_message = "Signed in successfully."
    expect(page).to have_content(success_message)
  end

  scenario "Editing a post" do
    click_link 'New Post'
    fill_in 'post_title', :with => "Test"
    fill_in "post_body", :with => "Test"
    click_button "Create Post"
    expect(page).to have_content('Post was successfully created.')
    click_link 'Edit'
    fill_in 'post_title', :with => "Post title edited"
    fill_in "post_body", :with => "Post body edited"
    find('input[name="commit"]').click
    expect(page).to have_content('Post was successfully updated.')
    expect(page).to have_selector('#post-title', text: 'Post title edited')
    expect(page).to have_selector('#post-body', text: 'Post body edited')
  end


end