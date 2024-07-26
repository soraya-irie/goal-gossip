class User < ApplicationRecord
  GUEST_USER_EMAIL = "guest@example.com"
  USER_NAME = "ゲスト"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = USER_NAME
    end
  end
end
