class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
  end

  def new
    @user = User.new
    redirect_to new_user_registration_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :rfc, :phone_number, :hire_date, :job, :salary, :is_employee, :is_manager, :manager_id, :email)
  end
end
