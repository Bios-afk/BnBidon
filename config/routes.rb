Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"

  resources :flats, expect: [:index], only: [:edit, :create, :show, :update, :destroy] do
    resources :bookings, only: [:create]
    resources :flat_reviews, only: [:create]
    resource :dashboard, only: [:show]
  end

  patch 'avatar', to: 'users#update_avatar', as: :avatar_users
  get 'dashboard', to: 'dashboards#index', as: 'dashboard'
end
