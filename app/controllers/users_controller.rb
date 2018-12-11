class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    redirect_to new_user_registration_path
  end

  def create
    @user = User.new(params[:user])
    @user.save

    redirect_to user_path(@user)
  end

  def update
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :lasst_name, :rfc, :phone_number, :hire_date, :job, :salary, :is_employee, :is_manager, :manager_id, :email)
  end
end
