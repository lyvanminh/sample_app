class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      flash[:success] = t ".login_success"
      log_in user
      redirect_to user
    else
      flash[:danger] = t ".login_error"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t ".logout_success"
    redirect_to root_url
  end
end
