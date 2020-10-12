Rails.application.routes.draw do
  get 'users/show'
  resources :users, only: [:show]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  resources :homes, only: :index
  resources :books do
    resources :comments
  end  
end
