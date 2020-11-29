Rails.application.routes.draw do
  resources :venues, except: [:new, :create, :edit, :update, :destroy]
  resources :showings, except: [:new, :create, :edit, :update, :destroy]
  resources :bookings, except: [:show, :edit, :update, :index]
  resources :films, except: [:new, :create, :show, :edit, :update, :destroy]
  root 'home#index'
  get 'film', to: "films#index"
  get 'showings', to: 'showings#index'
  get 'mybookings', to: 'my_bookings#index'
  get 'mybookings/find', to: "my_bookings#find"
  post 'book', to: "bookings#parseAjax"

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
