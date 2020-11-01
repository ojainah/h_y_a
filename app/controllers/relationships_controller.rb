class RelationshipsController < ApplicationController
  before_action :set_user 

  def create
    following = current_user.follow(@user)
    if following.save
      redirect_to pages_show_path, flash: {notice: 'ユーザーをフォローしました' }
    else
      render :back
      flash.now[:alert] = "ユーザーのフォローに失敗しました"
    end
  end


  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_to pages_show_path, flash: {notice: 'ユーザーのフォローを解除しました' }
    else
      render :back
      flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
    end
  end

  # 呼び出しをクラス内部に限定する
  private
  def set_user
    @user = User.find(params[:follow_id])
  end
end
