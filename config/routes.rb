Rails.application.routes.draw do
  resources :bookings
  resources :showings
  resources :venues
  resources :films, only: [:index]
  root 'home#index'
  get 'film', to: "film#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
