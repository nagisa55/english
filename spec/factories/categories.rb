FactoryBot.define do
  factory :category do
    sequence(:id) { |n| n }
    name { "リーディング" }
  end
end
