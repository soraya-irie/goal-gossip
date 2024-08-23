require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it "nameがあれば有効であること" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "nameがなければ無効なこと" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "nameが15文字以内であれば有効なこと" do
      user = FactoryBot.build(:user, name: "a" * 15)
      expect(user).to be_valid
    end

    it "nameが16文字以上であれば無効であること" do
      user = FactoryBot.build(:user, name: "a" * 16)
      user.valid?
      expect(user.errors[:name]).to include("は15文字以内で入力してください")
    end
  end

  describe 'methods' do
    it "User.guestメソッドがゲストユーザーを返すこと" do
      user = User.guest
      expect(user.name).to eq("ゲスト")
      expect(user.email).to eq("guest@example.com")
      expect(user.password).to be_present
    end

    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post)
    end

    it "bookmarkメソッドがブックマークを追加すること" do
      @user.bookmark(@post)
      expect(@user.bookmarks.count).to eq(1)
    end

    it "unbookmarkメソッドがブックマークを削除すること" do
      @user.bookmark(@post)
      @user.unbookmark(@post)
      expect(@user.bookmarks.count).to eq(0)
    end

    it "bookmarked?メソッドがブックマークされているかどうかを返すこと" do
      @user.bookmark(@post)
      expect(@user.bookmarked?(@post)).to be_truthy
    end

    it "own?メソッドがオブジェクトのユーザーIDと一致するかどうかを返すこと" do
      @post = FactoryBot.create(:post, user: @user)
      expect(@user.own?(@post)).to be_truthy
    end
  end
end
