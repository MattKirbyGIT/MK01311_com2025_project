Rails.application.routes.draw do
  resources :venues
  resources :showings
  resources :bookings
  resources :films
  root 'home#index'
  get 'film', to: "films#index"
  get 'showings', to: 'showings#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
