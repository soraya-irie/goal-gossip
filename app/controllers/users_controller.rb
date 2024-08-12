class UsersController < ApplicationController
  before_action :set_q, only: %i[index show search]

  def index
    @pagy, @posts = pagy(Post.includes(:user).order(created_at: :desc))
  end

  def show
    @user = User.find(params[:id])
    @pagy, @posts = pagy(@user.posts.order(created_at: :desc))
  end

  def search
    @pagy, @results = pagy(@q.result)
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
  end
end
