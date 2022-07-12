class HomeController < ApplicationController
  def index
    @posts = Post.all.order('posts.created_at DESC')
  end
end
