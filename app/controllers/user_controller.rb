class UserController < ApplicationController
  def dashboard
    @blogs = Post.where(user_id: Current.user.id) if Current.user
  end
end
