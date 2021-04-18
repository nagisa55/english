require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーション" do
    before do
      @comment = create(:comment)
    end

    it "200文字以内のコメントは、コメント投稿が出来る" do
      expect(@comment.valid?). to eq(true)
    end

    it "未入力だとコメント投稿が出来ない" do
      @comment.content = ""
      expect(@comment.valid?). to eq(false)
    end

    it "コメントが201文字以上だとコメント投稿が出来ない" do
      @comment.content = @comment.content*60
      expect(@comment.valid?). to eq(false)
    end
  end
end
