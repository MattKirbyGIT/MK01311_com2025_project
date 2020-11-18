Rails.application.routes.draw do
  resources :showings
  resources :bookings
  resources :venues
  resources :films
  root 'home#index'
  get 'film', to: "film#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
