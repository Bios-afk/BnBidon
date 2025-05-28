Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :flats, expect: [:index], only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :bookings, only: [:create]
    resources :flat_reviews, only: [:create]
  end

  get 'dashboard', to: 'dashboards#index', as: 'dashboard'
end
