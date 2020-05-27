Rails.application.routes.draw do
  get 'invitation/create'
  root 'welcome#index'
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: %i[show create new] do 
    resources :invites
  end
  resources :invitations, only: %i[create]
  resources :sign_ups, only: %i[create]
end
