Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events
  resources :artists

  root 'events#index'


end
