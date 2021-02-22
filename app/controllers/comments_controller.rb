class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to @comment.post
    else
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
