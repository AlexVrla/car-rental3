Rails.application.routes.draw do
  root to: 'bookings#new'
  resources :bookings, only: %i[new create edit update show] do
    resources :cars, only: %i[index show]
  end
end
