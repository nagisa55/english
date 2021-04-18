# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :require_logged_in

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = "コメントしました。"
      redirect_to @comment.post
    else
      flash[:danger] = "コメント出来ませんでした。"
      redirect_to @comment.post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
