require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  before do
    @user = create(:user)
  end

  describe "ログインとログアウト" do
    before do
      visit root_path
      click_on "ログイン"
      fill_in "session[email]", with: @user.email
      fill_in "session[password]", with: @user.password
      fill_in "session[password_confirmation]", with: @user.password
      click_button "ログイン"
    end

    it "ログインする" do
      expect(page). to have_content "ログインしました。"
    end

    it "ログアウトする" do
      click_on "ログアウト"
      expect(page). to have_link "ログイン"
    end
  end

  describe "投稿する" do
    context "ユーザーがログインしている場合" do
      let!(:category){create(:category)}
      before do
        visit root_path
        click_on "ログイン"
        fill_in "session[email]", with: @user.email
        fill_in "session[password]", with: @user.password
        fill_in "session[password_confirmation]", with: @user.password
        click_button "ログイン"

        click_on "投稿"
        fill_in "post[title]", with: "EIGO"
        select "リーディング", from: "post[category_id]"
        fill_in "post[content]", with: "READING"
        click_on "投稿する"
      end

      it "投稿ページ表示" do
        expect(page). to have_content "投稿しました。"
      end
    end
    context "ユーザーがログインしていない場合" do
      it "ログインページに遷移" do
        visit new_post_path
        expect(page). to have_content "ログインしてください。"
      end
    end
  end

  describe "コメントをする" do
    let!(:post) {create(:post)}
    context "ユーザーがログインしている場合" do
      before do
        visit root_path
        click_on "ログイン"
        fill_in "session[email]", with: @user.email
        fill_in "session[password]", with: @user.password
        fill_in "session[password_confirmation]", with: @user.password
        click_button "ログイン"
      end
      it "コメント入力欄表示" do
        visit post_path(post)
        expect(page). to have_button "コメントする"
      end
    end
    context "ユーザーがログインしていない場合" do
      it "コメント入力欄非表示" do
        visit post_path(post)
        expect(page). to have_content "コメントするには、ログインしてください。"
      end
    end
  end
end
