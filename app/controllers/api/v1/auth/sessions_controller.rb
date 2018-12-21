# # frozen_string_literal: true

# class Api::V1::Auth::SessionsController < Devise::SessionsController
#   acts_as_token_authentication_handler_for User, fallback: :none
#   respond_to :json

#   protected

#   def respond_with(resource, _opts = {})
#     render json: resource
#   end

#   def response_to_on_destroy
#     head :no_content
#   end
# end
