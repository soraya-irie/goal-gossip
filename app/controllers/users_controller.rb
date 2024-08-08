class UsersController < ApplicationController
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end
end
