class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: %i[index edit update]

  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    redirect_to root_path unless current_user == User.find(params[:id]) || current_user.admin?
  end

  def edit; end

  def update
    if @user.update user_params
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :admin, :name)
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end

end
