class Admin::PostsController < ApplicationController
  def index
    @posts = Posts.all.order(created_at: :desc)
  end
end
