Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: %i[show create new] do 
    resources :invites
  end
end
