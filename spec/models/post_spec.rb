require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post, user: @user)
  end

  it "user_id, stadium_name, address, match_date, supported_team, commentがあれば有効であること" do
    expect(@post).to be_valid
  end

  it "user_idがなければ無効であること" do
    @post.user_id = nil
    @post.valid?
    expect(@post.errors[:user]).to include("を入力してください")
  end

  it "stadium_nameがなければ無効であること" do
    @post.stadium_name = nil
    @post.valid?
    expect(@post.errors[:stadium_name]).to include("を入力してください")
  end

  it "addressがなければ無効であること" do
    @post.address = nil
    @post.valid?
    expect(@post.errors[:address]).to include("を入力してください")
  end

  it "match_dateがなければ無効であること" do
    @post.match_date = nil
    @post.valid?
    expect(@post.errors[:match_date]).to include("を入力してください")
  end

  it "supported_teamがなければ無効であること" do
    @post.supported_team = nil
    @post.valid?
    expect(@post.errors[:supported_team]).to include("を入力してください")
  end

  it "commentがなければ無効であること" do
    @post.comment = nil
    @post.valid?
    expect(@post.errors[:comment]).to include("を入力してください")
  end

  it "stadium_nameが100文字以内であれば有効であること" do
    @post.stadium_name = "a" * 100
    expect(@post).to be_valid
  end

  it "stadium_nameが101文字以上であれば無効であること" do
    @post.stadium_name = "a" * 101
    @post.valid?
    expect(@post.errors[:stadium_name]).to include("は100文字以内で入力してください")
  end

  it "addressが100文字以内であれば有効であること" do
    @post.address = "a" * 100
    expect(@post).to be_valid
  end

  it "addressが101文字以上であれば無効であること" do
    @post.address = "a" * 101
    @post.valid?
    expect(@post.errors[:address]).to include("は100文字以内で入力してください")
  end

  it "supported_teamが100文字以内であれば有効であること" do
    @post.supported_team = "a" * 100
    expect(@post).to be_valid
  end

  it "supported_teamが101文字以上であれば無効であること" do
    @post.supported_team = "a" * 101
    @post.valid?
    expect(@post.errors[:supported_team]).to include("は100文字以内で入力してください")
  end

  it "commentが200文字以内であれば有効であること" do
    @post.comment = "a" * 200
    expect(@post).to be_valid
  end

  it "commentが201文字以上であれば無効であること" do
    @post.comment = "a" * 201
    @post.valid?
    expect(@post.errors[:comment]).to include("は200文字以内で入力してください")
  end

  it "match_dateが今日以前の日付であれば有効であること" do
    @post.match_date = Date.today
    expect(@post).to be_valid
  end

  it "match_dateが今日以降の日付であれば無効であること" do
    @post.match_date = Date.today + 1
    @post.valid?
    expect(@post.errors[:match_date]).to include("は今日以前の日付で入力してください")
  end
end
