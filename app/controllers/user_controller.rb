class UserController < ApplicationController
  def unauthorized
  end

  def dashboard
    if Current.user
      @blogs = Post.where(user_id: Current.user.id)
    else
      render :unauthorized
    end
  end
end
