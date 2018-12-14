class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = current_user.subordinates
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      return redirect_to user_path(current_user) if @user.id == current_user.id

      return redirect_to user_user_path(current_user, @user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :rfc, :phone_number, :hire_date, :job, :salary, :is_manager, :manager_id, :email)
  end
end
