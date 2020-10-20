Rails.application.routes.draw do
   # rootをログイン画面に設定
   devise_scope :user do
    root "users/sessions#new"
  end
end