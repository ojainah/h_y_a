Rails.application.routes.draw do

  # get "/" => "users#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get '/', to: 'users/sessions#index'
end