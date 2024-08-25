require 'rails_helper'

RSpec.describe "Posts", type: :system do
  scenario "ユーザーが新しい投稿を作成する" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "ログインフォームへ"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
    expect(page).to have_content "ログインしました"

    click_link "感想を投稿する"
    fill_in "スタジアム名", with: "味の素スタジアム"
    fill_in "住所", with: "日本、〒182-0032 東京都調布市西町３７６−３"
    fill_in "観戦日", with: 1.day.ago
    fill_in "応援したチーム", with: "ブライトン"
    fill_in "観戦した感想", with: "ブライトンの試合は面白かった"

    expect {
      click_button "投稿する"
    }.to change { Post.count }.by(1)

    expect(page).to have_current_path post_path(Post.last)
    expect(page).to have_content "投稿が保存されました"
  end

  scenario "ユーザーが投稿を削除する" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)

    visit root_path
    click_link "ログインフォームへ"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"

    visit post_path(post)
    expect {
      find('a[data-turbo-confirm="投稿を削除してよろしいですか？"]').click
    }.to change { Post.count }.by(-1)
    expect(page).to have_content "投稿が削除されました"
    expect(page).to have_current_path root_path
  end

  scenario "ユーザーが投稿を編集する" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)

    visit root_path
    click_link "ログインフォームへ"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"

    visit edit_post_path(post)
    expect(page).to have_current_path edit_post_path(post)

    fill_in "スタジアム名", with: "豊田スタジアム"
    fill_in "住所", with: "日本、〒471-0016 愛知県豊田市千石町７丁目２"
    fill_in "観戦日", with: 1.week.ago
    fill_in "応援したチーム", with: "川崎フロンターレ"
    fill_in "観戦した感想", with: "川崎フロンターレの試合は面白かった"

    click_button "更新する"
    expect(page).to have_content "投稿が更新されました"
    expect(page).to have_current_path post_path(post)
  end
end
