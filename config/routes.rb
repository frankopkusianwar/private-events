Rails.application.routes.draw do
  get 'user/show'
  root 'welcome#index'
  devise_for :users
  resources :users, only: [:show]
end
