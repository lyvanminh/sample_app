class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :find_by_user, only: %i(show edit update destroy)

  def index
    @users = User.all.page(params[:page])
                 .per Settings.users_controller.page_number
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_activation_email
      flash[:info] = t(".check_mail")
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @microposts = @user.microposts.page(params[:page])
                       .per Settings.users_controller.page_number
  end

  def edit; end

  def update
    if @user.update user_params
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t(".del_user")
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def find_by_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t(".don't_find")
    redirect_to login_url
  end
end
