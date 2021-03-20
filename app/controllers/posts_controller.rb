class PostsController < ApplicationController

  def index
    if params[:category_id]
      @user = User.find(params[:user_id])
      @posts = Post.where(category_id: params[:category_id]).order(created_at: :desc)
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
    else
      @posts = Post.all
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
    @comment = current_user.comments.new
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:category, :title, :content, :category_id)
  end
end
