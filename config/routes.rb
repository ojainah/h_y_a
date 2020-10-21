Rails.application.routes.draw do
  # get 'user/precomplete'
  
  ## ユーザー登録のメール送信後に送信完了画面へと遷移
  devise_for :users# , :controllers => { :registrations => "registrations" }

  root 'pages#index'
  get 'pages/show'
end