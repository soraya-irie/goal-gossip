class UsersController < ApplicationController
  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end
end
