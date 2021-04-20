require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET #index" do
    let(:post){create(:post)}

    before
      get posts_path
    end
    it "リクエストが成功すること" do

    end
    it "ユーザー名が表示されること" do
    it "ユーザーのアイコンが表示されること" do
    it "投稿のカテゴリーが表示されること" do
    it "投稿タイトルが表示されること" do
    it "投稿の内容が表示されること" do

  end
end
