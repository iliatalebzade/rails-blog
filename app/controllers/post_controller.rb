class PostController < ApplicationController
  def create
    if Current.user
      @blog_post = Post.new
    else
      redirect_to unauthorized_path
    end
  end

  def new
    @blog_post = Post.new(post_params)
    if @blog_post.save
      redirect_to root_path, notice: "Post created successfully!"
    else
      render :create, status: :unprocessable_entity
    end
  end

  def getpost
    @post = Post.find(params[:id])
    @author = User.find(@post.user_id) # user_id
  end

  private

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: Current.user.id)
  end
end
