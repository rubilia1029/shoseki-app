Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  resources :homes, only: :index
  resources :books do
    resources :comments
    resource :favorites, only: [:create, :destroy]
  end  
end
