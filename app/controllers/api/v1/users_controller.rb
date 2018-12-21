class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, fallback: :none
  before_action :set_user, only: %i[show update]

  def index
    @users = policy_scope(User)
  end

  def show
  end

  def update
    @user = @user.update(user_params)
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :rfc, :phone_number, :hire_date, :job, :salary, :is_manager, :manager_id, :email)
  end

  def render_error
    render  json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
  end
end
