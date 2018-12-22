# frozen_string_literal: true

class Api::V1::Auth::RegistrationsController < Devise::RegistrationsController
  acts_as_token_authentication_handler_for User, fallback: :none
  skip_before_action :verify_authenticity_token, only: :create
  before_action :sign_up_params, only: %i[create update]
  # before_action :configure_account_update_params, only: [:update]
  respond_to :json

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # # POST /resource
  def create
    user = User.create(sign_up_params)
    authorize user

    if @user.save
      render status: 200, json: { message: "Successfully added employee to your team",
                                  new_employee: user }.to_json
    else
      render status: 400,
             json: { message: @user.errors.full_messages }
    end
  end

  # PUT /resource
  def update
    if @user.update(sign_up_params)
      render :show
    else
      render_error
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  protected

  def sign_up_params
    params.require(:user).permit( :first_name,
                                  :last_name,
                                  :rfc,
                                  :phone_number,
                                  :hire_date,
                                  :job,
                                  :salary,
                                  :email,
                                  :is_manager,
                                  :manager_id,
                                  :password,
                                  :password_confirmation )
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
