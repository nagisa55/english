class ToppagesController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @users = User.all
    @ranking_users = User.find(Post.group(:user_id).order('count(user_id) desc').limit(4).pluck(:user_id))
    @ranking_posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(4).pluck(:post_id))
  end
end
