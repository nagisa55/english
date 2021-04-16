require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  describe "ログインとログアウト" do
    before do
      @user = create(:user)
    end

    it "ログインする" do
    visit root_path
    fill_in "session[email]", with: "test1@test.com"
    fill_in "session[password]", with: "password"
    fill_in "session[password_confirmation]", with: "password"
    click_button "ログイン"

    expect(page). to have_content "ログインしました。"
    end

    it "ログアウトする" do
      visit logout_path
      expect(page). to have_content "ログアウトしました。"
    end
    end
end
