require 'support/factory_girl'
require 'support/factory'
require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "Given a User" do

    before do
      @user = create(:user)
      allow(request.env['warden']).to receive(:authenticate!).and_return(@user)
      allow(controller).to receive(:current_user).and_return(@user)
    end

    it "show all Post" do
      get :user_post, id:@user.id
      expect(response).to render_template(:user_post)
    end
  end
end
