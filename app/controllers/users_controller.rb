class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @posts = @user.posts
  end

end
