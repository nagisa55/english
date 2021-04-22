FactoryBot.define do
  factory :comment do
    sequence(:id){ |n| n }
    content { "コメント" }
    association :user
    association :post
  end
end
