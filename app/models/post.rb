class Post < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  validates :user_id, :stadium_name, :address, :match_date, :supported_team, :comment, presence: true
  validates :stadium_name, :address, :supported_team, length: { maximum: 100 }
  validates :comment, length: { maximum: 200 }
  validate :validate_not_future_date

  def self.ransackable_attributes(auth_object = nil)
    %w(stadium_name address match_date supported_team comment created_at)
  end

  private

  def validate_not_future_date
    if match_date.present? && match_date > Date.today
      errors.add(:match_date, "は今日以前の日付で入力してください")
    end
  end
end
