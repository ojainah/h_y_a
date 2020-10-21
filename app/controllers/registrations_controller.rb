# # メール送信後に遷移する画面を設定

# class RegistrationsController < Devise::RegistrationsController# Deviseを継承してコントローラを作る
#   def after_sign_up_path_for(resource)
#     user_precomplete_path
#   end
#    def after_inactive_sign_up_path_for(resource)# メール送信後の遷移先を指定
#     user_precomplete_path
#    end
#  end