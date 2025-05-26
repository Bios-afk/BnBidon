Rails.application.routes.draw do
  root to: "flats#home"

  resources :flats, expect: [:index], only: [:new, :create, :show] do
    resources :flat_reviews, only: [:create]
    resources :bookings, only: [:new, :create]
  end
end
