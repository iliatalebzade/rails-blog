class AuthenticationController < ApplicationController
  def register
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to root_path
    else
      render :register
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def login_page; end

  def login
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :login_page
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
