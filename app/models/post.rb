class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, :stadium_name, :address, :match_date, :supported_team, :comment, presence: true
end
