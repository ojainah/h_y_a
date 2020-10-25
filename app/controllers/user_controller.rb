class UserController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  # before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def precomplete
  end
end
