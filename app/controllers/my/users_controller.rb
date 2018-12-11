class My::UsersController < ApplicationController
  def index
    @users = User.where(manager_id: current_user.id)
  end
end
