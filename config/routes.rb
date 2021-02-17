Rails.application.routes.draw do
  
  devise_for :users
  root 'users#home'
  resources :users
  resources :transfers
  get '/transfers/no_grp', to: 'transfers#no_grp'
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
