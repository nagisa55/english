require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  describe "ログインとログアウト" do
    before do
      @user = create(:user)
    end

    it "ログインする" do
      visit root_path
      click_on "ログイン"
      fill_in "session[email]", with: @user.email
      fill_in "session[password]", with: @user.password
      fill_in "session[password_confirmation]", with: @user.password
      click_button "ログイン"

      expect(page). to have_content "ログインしました。"
    end

    it "ログアウトする" do
      visit root_path
      click_on "ログイン"
      fill_in "session[email]", with: @user.email
      fill_in "session[password]", with: @user.password
      fill_in "session[password_confirmation]", with: @user.password
      click_button "ログイン"

      click_on "ログアウト"
      expect(page). to have_link "ログイン", href: login_path

    end
  end
end
