# # frozen_string_literal: true

# class Auth::SessionsController < Devise::SessionsController
#   # before_action :configure_sign_in_params, only: [:create]

#   # GET /resource/sign_in
#   # def new
#   #   super
#   # end

#   # POST /resource/sign_in
#   # def create
#   #   super
#   # end

#   # DELETE /resource/sign_out
#   # def destroy
#   #   super
#   # end

#   ## JUST ADDED THAT FOR TESTING
#   protected

#   def respond_with(resource, _opts = {})
#     render json: resource
#   end

#   def response_to_on_destroy
#     head :no_content
#   end

#   # If you have extra params to permit, append them to the sanitizer.
#   # def configure_sign_in_params
#   #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
#   # end
# end
