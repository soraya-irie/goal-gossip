class User < ApplicationRecord
  GUEST_USER_EMAIL = "guest@example.com".freeze
  USER_NAME = "ゲスト".freeze

  has_many :posts, dependent: :destroy
  has_many :bookmarks
  has_many :bookmarked_posts, through: :bookmarks, source: :post
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = USER_NAME
    end
  end
end
