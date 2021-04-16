# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create]

  def index
    if params[:user_id]
      @posts = Post.includes([:user],[:category]).where(user_id: params[:user_id]).order(created_at: :desc)
      @posts = @posts.page(params[:page]).per(5)
      @user = User.find(params[:user_id])
    else
      @posts = Post.all.includes([:user],[:category]).order(created_at: :desc).page(params[:page]).per(5)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @posts = @user.posts.all.order(created_at: :desc)
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user_id)
  end

  def search
    @posts = Post.search(params[:search]).includes([:user],[:category])
    @keyword = params[:search]
    @posts = @posts.page(params[:page]).per(5)
  end

  def category
    @posts = Post.preload(:user,:category).where(category_id: params[:category_id]).order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(5)
    @category = Category.find(params[:category_id])
  end

  def sort
    selection = params[:keyword]
    @posts = Post.sort(selection)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
end
