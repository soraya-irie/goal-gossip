FactoryBot.define do
  factory :post do
    user { nil }
    stadium_name { "MyString" }
    address { "MyText" }
    match_date { "2024-08-02" }
    supported_team { "MyString" }
    comment { "MyText" }
  end
end
