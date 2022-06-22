Rails.application.routes.draw do
  get 'landing/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :authors
  resources :courses
  resources :books
  resources :tags
  resources :users

  root "landing#index"
 # root "books#index" 
end
