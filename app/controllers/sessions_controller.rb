class SessionsController < ApplicationController
  before_action :find_user, only: :create

  def new; end

  def create
    if @user&.authenticate(params[:session][:password])
      if @user.role?
        redirect_to admin_root_url
      else
        redirect_to root_url
      end
      log_in @user
    else
      flash.now[:danger] = t "login.text_login_failed"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def find_user
    @user = User.find_by(email: params[:session][:email].downcase)
    return if @user

    flash.now[:danger] = "login.text_login_not_found"
    redirect_to root_url
  end
end
