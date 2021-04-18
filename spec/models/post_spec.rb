require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = create(:post)
  end
  describe "バリデーション" do
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

  describe "キーワード検索" do
    context "検索文字列に一致する場合" do
      it "検索文字列に一致する投稿を表示" do
        expect(Post.search("Learning")).to include(@post)
      end
    end
    context "検索文字列に一致しない場合" do
      it "検索結果はありませんのページ表示" do
        expect(Post.search("Studying")).to be_empty
      end
    end
  end
end
