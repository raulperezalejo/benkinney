class UsersController < ApplicationController

  def user_post
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
  end

end
