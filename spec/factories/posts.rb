FactoryBot.define do
  factory :post, class: Post do
    content { "Learning English" }
    title { "eigo" }
    association :category
    association :user
  end
end
