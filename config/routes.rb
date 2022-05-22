Rails.application.routes.draw do
  resources :comments
  resources :tasks
  resources :boards
  resources :workspaces
  devise_for :members
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
