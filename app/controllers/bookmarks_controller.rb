class BookmarksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.bookmark(@post)
    flash[:notice] = "ブックマークしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = current_user.bookmarks.find(params[:id]).post
    current_user.unbookmark(@post)
    flash[:notice] = "ブックマークを解除しました"
    redirect_back(fallback_location: root_path)
  end
end
