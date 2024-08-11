class UsersController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.includes(:user).order(created_at: :desc))
  end

  def show
    @user = User.find(params[:id])
    @pagy, @posts = pagy(@user.posts.order(created_at: :desc))
  end
end
