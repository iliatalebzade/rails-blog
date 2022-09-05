class AuthenticationController < ApplicationController
  def register
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to root_path, notice: 'Successfully created an account, welcome!'
    else
      flash.now[:alert] = 'Invalid credentials, please address the mentioned problems'
      render :register, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    flash[:warning] = 'Sad to see you go, you have successfully logged out'
    redirect_to root_path
  end

  def login_page; end

  def login
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash.now[:alert] = 'Invalid E-mail or password'
      render :login_page, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
