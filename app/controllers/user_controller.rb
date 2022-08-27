class UserController < ApplicationController
  def unauthorized; end

  def dashboard
    if Current.user
      @blogs = Post.where(user_id: Current.user.id)
    else
      redirect_to unauthorized_path
    end
  end

  def show_user_or_dashboard
    @user = User.find(params[:id])
    if selected_user = Current.user
      redirect_to :dashboard
    else
      render :show_user
    end
  end
end
