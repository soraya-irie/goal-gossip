require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    before do
      @user = FactoryBot.create(:user)
      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      follow_redirect!
    end

    it "/posts/newにアクセスする" do
      get new_post_path
      expect(response).to have_http_status(:success)
    end

    it "/posts/:idにアクセスする" do
      post = FactoryBot.create(:post)
      get post_path(post)
      expect(response).to have_http_status(:success)
    end

    it "/posts/:id/editにアクセスする" do
      post = FactoryBot.create(:post, user: @user)
      get edit_post_path(post)
      expect(response).to have_http_status(:success)
    end

    it "posts/bookmarksにアクセスする" do
      get bookmarks_posts_path
      expect(response).to have_http_status(:success)
    end
  end
end
