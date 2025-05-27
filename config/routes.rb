Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # resources :flats, expect: [:index], only: [:new, :create, :show] do
  #   resources :flat_reviews, only: [:create]
  #   resources :bookings, only: [:new, :create]
  # ends

  get 'user/:id/dashboard', to: 'users#dashboard', as: 'user_dashboard'
end
