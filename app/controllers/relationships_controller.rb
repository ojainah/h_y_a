class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      redirect_to controller: :pages, action: :profile, id: @user, success: "ユーザーをフォローしました"
    else
      flash.now[:alert] = "ユーザーのフォローに失敗しました"
    end
  end


  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_to controller: :pages, action: :profile, id: @user, success:  "ユーザーのフォローを解除しました"
    else
      flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
    end
  end

  # 呼び出しをクラス内部に限定する
  private
  def set_user
    @user = User.find(params[:follow_id])
  end
end
