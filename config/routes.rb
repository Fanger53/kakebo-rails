Rails.application.routes.draw do
  
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  root 'users#home'
  get "/transfers/ext", to: "transfers#ext"
  resources :incomes
  resources :users
  resources :transfers
  
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
