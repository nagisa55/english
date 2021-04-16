FactoryBot.define do
  factory :user do
    name { "tanaka" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password_digest { "password" }
    icon { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg')) }
    good_point { "good_point" }
    profile { "Hello" }
  end
end