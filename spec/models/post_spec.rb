require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーション" do
    before do
      @post = create(:post)
      end

    it "タイトル、カテゴリー、投稿内容を入力すると投稿できる" do
      expect(@post).to be_valid
    end

    it "カテゴリーを入力しないと投稿できない" do
      @post.category_id = ""
      expect(@post.valid?).to eq(false)
    end

    it "タイトルを入力しないと投稿できない" do
      @post.title = ""
      expect(@post.valid?).to eq(false)
    end

    it "投稿内容を入力しないと投稿できない" do
      @post.content = ""
      expect(@post.valid?). to eq(false)
    end
  end

  describe "クラスメソッド" do
    it "検索文字列に一致する投稿を表示" do
      user = User.create(
        name: "satou",
        email: "satou@test.com",
        password_digest: "password"
      )

      post1 = user.posts.create(
        content: "Learning English",
        title: "eigo",
        category_id: 2
      )
      post2 = user.posts.create(
        content: "Studying English",
        title: "eigo",
        category_id: 2
      )
      expect(Post.search("Studying")).to include(post2)
    end
  end
end
