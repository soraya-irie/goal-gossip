require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  it 'user_idがpost_idに対して一意であることを検証する' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    FactoryBot.create(:bookmark, user: user, post: post)
    duplicate_bookmark = FactoryBot.build(:bookmark, user: user, post: post)

    expect(duplicate_bookmark).not_to be_valid
    expect(duplicate_bookmark.errors[:user_id]).to include('はすでに存在します')
  end
end
