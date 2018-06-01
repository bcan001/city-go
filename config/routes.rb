Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/tomorrows_events', to: 'events#tomorrows_events', as: 'tomorrows_events'



  resources :events
  resources :artists
  resources :venues


  root 'events#index'


end
