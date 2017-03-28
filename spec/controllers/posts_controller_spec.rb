require 'support/factory_girl'
require 'support/factory'
require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "Get Post" do

    before do
      @user = create(:user)
      @post = create(:post)
      allow(request.env['warden']).to receive(:authenticate!).and_return(@user)
      allow(controller).to receive(:current_user).and_return(@user)
    end

    it "show all Post" do
      get :index
      expect(response).to render_template(:index)
    end

    it "show one post" do
      get :show, id:@post.id
      expect(response).to render_template(:show)
    end


  end
end
