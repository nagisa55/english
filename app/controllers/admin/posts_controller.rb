class Admin::PostsController < ApplicationController
  before_action :admin_user

  def index
    @posts = Post.includes([:user],[:category]).order(created_at: :desc).page(params[:page]).per(5)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render :index
  end

  private
  def admin_user
    redirect_to root_path unless current_user&.admin?
  end
end
