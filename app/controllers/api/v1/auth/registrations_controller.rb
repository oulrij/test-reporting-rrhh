# frozen_string_literal: true

class Api::V1::Auth::RegistrationsController < Devise::RegistrationsController
  acts_as_token_authentication_handler_for User, fallback: :none
  skip_before_action :verify_authenticity_token, only: :create
  before_action :sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  respond_to :json

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # # POST /resource
  def create
    user = User.create(sign_up_params)
    if user.save
      render status: 200, json: { message: "Successfully added employee to your team",
                                  new_employee: user }.to_json
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def sign_up_params
    params.require(user).permit(%i[first_name
                                    last_name
                                    rfc
                                    phone_number
                                    hire_date
                                    job
                                    salary
                                    email
                                    is_manager
                                    manager_id
                                    password
                                    password_confirmation])
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
