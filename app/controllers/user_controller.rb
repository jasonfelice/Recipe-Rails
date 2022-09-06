class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show; end

  private

  def set_user
    @user = current_user
  end
end
