Rails.application.routes.draw do
  
  devise_for :users
  root 'users#home'
  get "/transfers/ext", to: "transfers#ext"
  resources :users
  resources :transfers
  
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
