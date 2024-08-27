require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "ルートページにアクセスする" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "/users/sign_upにアクセスする" do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end

    it "/users/sign_inにアクセスする" do
      get new_user_session_path
      expect(response).to have_http_status(:success)
    end

    it "/users/editにアクセスする" do
      user = FactoryBot.create(:user)
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      follow_redirect!
      get edit_user_registration_path
      expect(response).to have_http_status(:success)
    end

    it "/users/:idにアクセスする" do
      user = FactoryBot.create(:user)
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      follow_redirect!
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it "/users/searchにアクセスする" do
      get search_users_path
      expect(response).to have_http_status(:success)
    end
  end
end
