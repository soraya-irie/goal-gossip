class User < ApplicationRecord
  GUEST_USER_EMAIL = "guest@example.com".freeze
  USER_NAME = "ゲスト".freeze

  has_many :posts, dependent: :destroy
  has_many :bookmarks
  has_many :bookmarked_posts, through: :bookmarks, source: :post
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validates :name, presence: true, length: { maximum: 15 }

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = USER_NAME
    end
  end

  def bookmark(post)
    bookmarked_posts << post
  end

  def unbookmark(post)
    bookmarked_posts.destroy(post)
  end

  def bookmarked?(post)
    bookmarked_posts.include?(post)
  end

  def own?(object)
    id == object.user_id
  end
end
