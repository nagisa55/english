class PostsController < ApplicationController
  def index
    if params[:category_id]
      @posts = Post.where(category_id: params[:category_id]).order(created_at: :desc)
      @posts = @posts.page(params[:page]).per(5)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
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
    params.require(:post).permit(:title, :content, :category_id)
  end
end
