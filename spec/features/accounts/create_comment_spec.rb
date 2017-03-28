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

  scenario "creating a comment on a post" do
    click_link 'New Post'
    fill_in 'post_title', :with => "Test"
    fill_in "post_body", :with => "Test"
    click_button "Create Post"
    success_message = "Post was successfully created."
    expect(page).to have_content(success_message)

    click_button 'Add new Comment'
    fill_in 'comment_body', :with => "First comment"
    find('input[name="commit"]').click
    expect(page).to have_content('Thanks for commenting on this post')
    expect(page).to have_content('First comment')
  end

end