class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      users_show_path  #指定したいパスに変更
    else
      flash[:notice] = "新規登録完了しました。次に名前を入力してください" 
      users_index_path  #指定したいパスに変更
    end
  end

  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとemailのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  end


end
