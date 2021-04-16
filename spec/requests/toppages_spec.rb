require 'rails_helper'

RSpec.describe "Toppages", type: :request do
  describe "Get #index" do
    let!(:user) {create(:user)}
    let!(:post) {create(:post)}
    before do
      get root_path
    end

    it "正常にレスポンスを返す" do
      expect(response).to have_http_status(200)
    end

    it "投稿タイトルが表示されていること" do
      expect(response.body).to include post.title
    end

    it "投稿内容が表示されていること" do
      expect(response.body).to include post.content
    end

    it "投稿数が表示されていること" do
      expect(response.body).to include user.posts.count.to_s
    end

    it "ユーザー名が表示されていること" do
      expect(response.body).to include user.name
    end

  end
end
