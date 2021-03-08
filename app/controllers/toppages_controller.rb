class ToppagesController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @users = User.all
  end
end
