class PostController < ApplicationController
  before_action :set_post, only: %i[edit update]

  def create
    if Current.user
      @blog_post = Post.new
    else
      redirect_to unauthorized_path
    end
  end

  def new
    blog_post = Post.new post_params
    if blog_post.save
      redirect_to root_path, notice: 'Post created successfully!'
    else
      render :create, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def getpost
    @post = Post.find(params[:id])
    @new_comment = Comment.new if Current.user
    @user = Current.user
  end

  private

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: Current.user.id)
  end

  def set_post
    @post = Current.user.post.find(params[:id])
  end
end
