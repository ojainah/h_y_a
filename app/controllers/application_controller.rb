class ApplicationController < ActionController::Base
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  # 弾かれがちな不明なパラメーターも渡せるようにする。
  protect_from_forgery with: :exception
  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後、pages/showに移動する
  def after_sign_in_path_for(resource)
    pages_show_path
  end

  private
      def sign_in_required
          redirect_to new_user_session_url unless user_signed_in?
      end

      protected
    def configure_permitted_parameters
      # サインアップ時にusernameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile])
    end
end
