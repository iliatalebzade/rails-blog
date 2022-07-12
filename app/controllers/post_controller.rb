class PostController < ApplicationController
  def create
    @blog_post = Post.new
  end

  def new
    @blog_post = Post.new(post_params)
    if @blog_post.save
      redirect_to root_path
    else
      render :create
    end
  end

  def getpost
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
