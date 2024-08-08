class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.includes(:posts).all
  end

  def show
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
