class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, :stadium_name, :address, :match_date, :supported_team, :comment, presence: true
  validate :validate_not_future_date

  private

  def validate_not_future_date
    if match_date.present? && match_date > Date.today
      errors.add(:match_date, ":今日以降の日付は選択できません。")
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["stadium_name", "address", "match_date", "supported_team"]
  end
end
