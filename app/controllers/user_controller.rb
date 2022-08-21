class UserController < ApplicationController
  def unauthorized
  end

  def dashboard
    if Current.user
      @blogs = Post.where(user_id: Current.user.id)
    else
      redirect_to unauthorized_path
    end
  end
end
