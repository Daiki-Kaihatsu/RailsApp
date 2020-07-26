Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations'
  }
  root 'homes#index'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :boards
end
  