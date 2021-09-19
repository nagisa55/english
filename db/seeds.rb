20.times do |n|
  User.create!(
    name: "田中#{n + 1}",
    email: "test#{n + 1}@test.com",
    profile: "宜しくお願いします。",
    password: "aaaaaa#{n + 1}",
    password_confirmation: "aaaaaa#{n + 1}",
    #icon: File.open("./app/assets/images/take.jpg")
  )
end

User.create!(
  name: "管理者",
  email: "admin@example.com",
  password: "adminuser",
  password_confirmation: "adminuser",
  admin: true
)

User.create!(
  name: "ゲスト",
  email: "guest@example.com",
  password: "password",
  password_confirmation: "password"
)

Category.create!(
  id: 1,
  name: "リーディング"
)
Category.create!(
  id: 2,
  name: "リスニング"
)
Category.create!(
  id: 3,
  name: "ライティング"
)
Category.create!(
  id: 4,
  name: "スピーキング"
)

5.times do |n|
  Post.create!(
    user_id: "#{n+1}",
    title: "この方法でリーディング力がアップしました",
    content: "この方法でリーディング力がアップしました。あいうえおあいうえおあいうえおあいうえおあいうえおあいうえお",
    category_id: 1
)
end

5.times do |n|
  Post.create!(
    user_id: "#{n+1}",
    title: "この方法でリスニング力がアップしました",
    content: "この方法でリスニング力がアップしました。あいうえおあいうえおあいうえおあいうえおあいうえおあいうえお",
    category_id: 2
  )
end

5.times do |n|
  Post.create!(
    user_id: "#{n+1}",
    title: "この方法でライティング力がアップしました",
    content: "この方法でライティング力がアップしました。あいうえおあいうえおあいうえおあいうえおあいうえおあいうえお",
    category_id: 3
  )
end

5.times do |n|
  Post.create!(
    user_id: "#{n+1}",
    title: "この方法でスピーキング力がアップしました",
    content: "この方法でスピーキング力がアップしました。あいうえおあいうえおあいうえおあいうえおあいうえおあいうえお",
    category_id: 4
  )
end

10.times do |n|
  Favorite.create!(
    user_id: "#{n+1}",
    post_id: "#{n+1}"
  )
end