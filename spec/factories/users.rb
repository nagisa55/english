FactoryBot.define do
  factory :user do
    name { "tanaka" }
    email { "tanaka@test.com" }
    password_digest { "password" }
    icon { "icon" }
    good_point { "good_point" }
    profile { "Hello" }
  end
end