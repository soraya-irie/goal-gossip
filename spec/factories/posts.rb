FactoryBot.define do
  factory :post do
    stadium_name { "味の素スタジアム" }
    address { "日本、〒182-0032 東京都調布市西町３７６−３" }
    match_date { 1.day.ago }
    supported_team { "ブライトン" }
    comment { "テスト用のコメントです。" }
    association :user
  end
end
