require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    before do
      @user = create(:user)
    end

    it "ユーザーネーム、パスワード、メール、パスワードがある場合は有効である" do
      expect(@user).to be_valid
    end

    it "アイコン画像、プロフィール、良かった点がなくても有効である" do
      @user.icon = ""
      @user.profile = ""
      @user.good_point = ""
      expect(@user).to be_valid
    end

    it "ユーザーネームがない場合、無効である" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "パスワードがない場合、無効である" do
      @user.password_digest = ""
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
    end

    it "メールアドレスがない場合、無効である" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "重複したメールアドレスの場合、無効である" do
      user1 = User.create(
        name: "suzuki",
        email: "rails@test.com",
        password: "password"
      )
      user2 = User.new(
        name: "suzuki",
        email: "rails@test.com",
        password: "password"
      )
      expect(user2.valid?).to eq(false)
    end
  end
end
