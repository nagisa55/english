require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET #index" do
    let!(:post){create(:post)}
    let!(:user){create(:user)}

    before do
      get posts_path
    end

    it "リクエストが成功すること" do
      expect(response).to have_http_status(200)
    end

    it "ユーザー名が表示されること" do
      expect(response.body).to include post.user.name
    end

    it "ユーザーのアイコンが表示されること" do
      pending(response.body).to include post.user.icon.url
    end

    it "投稿のカテゴリーが表示されること" do
      expect(response.body).to include post.category.name
    end

    it "投稿タイトルが表示されること" do
      expect(response.body).to include post.title
    end

    it "投稿の内容が表示されること" do
      expect(response.body).to include post.content
    end
  end

  describe "GET#show" do
    let!(:post){create(:post)}
    let!(:user){create(:user)}
    let(:comment){create(:comment)}

    before do
      get post_path(post.id)
    end

    it "リクエストが成功すること" do
      expect(response).to have_http_status(200)
    end

    it "ユーザー名が表示されていること" do
      expect(response.body).to include "tanaka"
    end

    it "ユーザーのアイコンが表示されていること" do
      pending(response.body).to include post.user.icon.url
    end

    it "投稿内容が表示されていること" do
      expect(response.body).to include post.content
    end

    it "投稿に対するコメント内容が表示されていること" do
      pending(response.body).to include post.comments.content
    end

    it "投稿に対するコメント数が表示されていること" do
      expect(response.body).to include post.comments.count.to_s
    end
  end
end