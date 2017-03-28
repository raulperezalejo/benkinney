require 'support/factory_girl'
require 'support/factory'
require 'rails_helper'


RSpec.describe Post, type: :model do

  context "Create new post" do
    it "with all inputs" do
      post = Post.new
      post.user = create(:user)
      post.title = 'title for this post'
      post.body = 'this is a body test for a post'
      post.save
      expect(post).to be_valid
    end

    it "without title " do
      post = Post.new
      post.user = create(:user)
      post.title = ''
      post.body = 'this is a body test for a post'
      post.save
      expect(post).to_not be_valid
    end

    it "without body" do
      post = Post.new
      post.user = create(:user)
      post.title = 'title for this post'
      post.body = ''
      post.save
      expect(post).to_not be_valid
    end

    it "without user" do
      post = Post.new
      post.title = 'title for this post'
      post.body = 'this is a body test for a post'
      post.save
      expect(post).to_not be_valid
    end
  end

  context "Comments" do
    it "add comments to a post" do
      user = create(:user)
      post = Post.new
      post.user = user
      post.title = 'title for this post'
      post.body = 'this is a body test for a post'
      post.save
      post.comments << post.comments.create!(:body => "first comment", user_id: user.id)
      post.comments << post.comments.create!(:body => "second comment", user_id: user.id)
      expect(post.comments.count).to eq(2)
    end
  end
end
