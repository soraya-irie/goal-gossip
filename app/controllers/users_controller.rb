class UsersController < ApplicationController
  before_action :search, only: [:index]

  def index
    @pagy, @posts = pagy(Post.includes(:user).order(created_at: :desc))
  end

  def show
    @user = User.find(params[:id])
    @pagy, @posts = pagy(@user.posts.order(created_at: :desc))
  end
end

  private

  def search
    @q = Post.ransack(params[:q])
    @results = @q.result
  end
