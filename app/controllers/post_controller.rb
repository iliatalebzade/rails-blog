class PostController < ApplicationController
  def create
    @blog_post = Post.new
  end

  def new
    @post = Post.new post_params
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def getpost
    @post = Post.find params[:id]
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
