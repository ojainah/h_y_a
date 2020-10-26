Rails.application.routes.draw do
  # get 'user/precomplete'


  ## ユーザー登録のメール送信後に送信完了画面へと遷移
  devise_for :users
  # , :controllers => { :registrations => "registrations" }

  root 'pages#index'
  get 'pages/show'
  get "pages/:id" => "pages#profile"
  get "pages/follow" => "pages#follow"
  

end