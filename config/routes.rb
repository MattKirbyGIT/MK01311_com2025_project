Rails.application.routes.draw do
  resources :showings, except: [:new, :create, :edit, :update, :destroy]
  resources :bookings, except: [:show, :edit, :update, :index]
  resources :films, except: [:new, :create, :edit, :update, :destroy]
  resources :venues, only: [:index]
  root 'home#index'
  get 'film', to: "films#index"
  get 'showings', to: 'showings#index'
  get 'mybookings', to: 'my_bookings#index'
  get 'mybookings/find', to: "my_bookings#find"
  post 'book', to: "bookings#parseAjax"
  get 'contact', to: "home#contact"
  post 'request_contact', to: 'home#request_contact'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
