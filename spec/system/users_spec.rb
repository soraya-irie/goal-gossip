require 'rails_helper'

RSpec.describe "Users", type: :system do
  context "ユーザーがログインしていない時" do
    scenario "ユーザーを新規登録する" do
      visit root_path
      click_link "新規登録フォームへ"
      fill_in "ユーザー名", with: "Alice"
      fill_in "メールアドレス", with: "alice@example.com"
      fill_in "パスワード", with: "password"
      fill_in "パスワード(確認用)", with: "password"
      click_button "登録する"
      expect(page).to have_content "アカウント登録が完了しました。"
      expect(page).to have_current_path root_path
    end

    scenario "ユーザーがログインする" do
      user = FactoryBot.create(:user)
      visit root_path
      click_link "ログインフォームへ"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      check "ログイン状態を記憶する"
      click_button "ログインする"
      expect(page).to have_content "ログインしました。"
      expect(page).to have_current_path root_path
    end

    scenario "ゲストログインする" do
      visit root_path
      find('.auth-link', text: "ゲストログイン").click
      expect(page).to have_content "ゲストユーザーとしてログインしました"
      expect(page).to have_current_path root_path
    end
  end

  context "ユーザーがログインしている時" do
    before do
      @user = FactoryBot.create(:user)
      visit root_path
      click_link "ログインフォームへ"
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      click_button "ログインする"
    end

    scenario "ユーザーがログアウトする" do
      find('.nav-link', text: "ログアウト").click
      expect(page).to have_content "ログアウトしました"
      expect(page).to have_current_path root_path
    end

    scenario "プロフィールを編集する" do
      find('.nav-link', text: "設定").click
      expect(page).to have_current_path edit_user_registration_path
      fill_in "ユーザー名", with: "John"
      fill_in "メールアドレス", with: "john@example.com"
      fill_in "パスワード", with: "new_password"
      fill_in "パスワード(確認用)", with: "new_password"
      fill_in "現在のパスワード", with: @user.password
      click_button "プロフィールを更新する"
      expect(page).to have_content "アカウント情報を変更しました"
      expect(page).to have_current_path root_path
    end

    scenario "アカウントを削除する" do
      find('.nav-link', text: "設定").click
      expect(page).to have_current_path edit_user_registration_path
      find('a[data-turbo-confirm="アカウントを削除してよろしいですか？"]').click
      expect(page).to have_content "アカウントを削除しました"
      expect(page).to have_current_path root_path
    end

    scenario "ファイルをアップロードする" do
      find('.nav-link', text: "設定").click
      attach_file "プロフィール画像", "#{Rails.root}/spec/files/attachment.jpg"
      fill_in "現在のパスワード", with: @user.password
      click_button "プロフィールを更新する"
      expect(page).to have_content "アカウント情報を変更しました"
      expect(page).to have_current_path root_path
      expect(@user.reload.avatar.attached?).to be_truthy
      expect(page).to have_selector "img[src$='attachment.jpg']"
    end
  end
end
