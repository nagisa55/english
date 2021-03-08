class PostsController < ApplicationController

  def index
    @posts = Post.where(id: params[:category_id]).order(created_at: :desc)
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
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:category, :title, :material, :content, :caegory_id)
  end
end
