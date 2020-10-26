# # メール送信後に遷移する画面を設定

class RegistrationsController < Devise::RegistrationsController
# Deviseを継承してコントローラを作る
#   def after_sign_up_path_for(resource)
#     user_precomplete_path
#   end
#    def after_inactive_sign_up_path_for(resource)# メール送信後の遷移先を指定
#     user_precomplete_path
#    end
  #  更新（編集の反映）時にパスワード入力を省く
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def show
    @user = User.find(params[:id])
  end

protected
  # アカウント編集後、プロフィール画面に移動する
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end
end