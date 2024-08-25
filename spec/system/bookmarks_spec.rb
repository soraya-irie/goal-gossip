require 'rails_helper'

RSpec.describe "Bookmarks", type: :system do
  it "ユーザーがブックマークを追加、解除する" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit root_path
    click_link "ログインフォームへ"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"

    expect {
      find('.bookmark-icon').click
      expect(page).to have_content "ブックマークしました"
    }.to change { Bookmark.count }.by(1)

    visit bookmarks_posts_path
    expect(page).to have_content post.stadium_name
    expect(page).to have_content post.match_date.strftime("%m/%d")
    expect(page).to have_content post.supported_team
    expect(page).to have_content post.comment

    visit root_path
    find('.unbookmark-icon').click
    expect(page).to have_content "ブックマークを解除しました"

    visit bookmarks_posts_path
    expect(page).not_to have_content post.stadium_name
    expect(page).not_to have_content post.match_date.strftime("%m/%d")
    expect(page).not_to have_content post.supported_team
    expect(page).not_to have_content post.comment
  end
end
