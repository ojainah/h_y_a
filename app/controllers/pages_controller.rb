class PagesController < ApplicationController
  # ログイン後showページに遷移する
  before_action :sign_in_required, only: [:show]

  def index
  end

  def show
    @users = User.all
    @user = User.find_by(params[:id])
  end

  def profile
    @users = User.all
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end

  def follow
    @users = User.all
    @user = User.find_by(id: params[:id])
  end
end