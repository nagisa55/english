FactoryBot.define do
  factory :post, class: Post do
    sequence(:id) { |n| n }
    content { "Learning English" }
    title { "eigo" }
    association :category
    association :user
  end
end
