class PostsController < ApplicationController
  def index
    authenticate_user!
    @posts = Post.all
  end

  def new
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @artist = Post.create!(post_params)
    redirect_to posts_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path()
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :post)
  end

end
