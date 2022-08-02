Rails.application.routes.draw do
  # get 'landing/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :authors, path: 'people' 
  # resources :courses
  resources :books
  get 'books/:year', to: 'books#by_year', as: 'by_years'
  resources :tags, path: 'learn'
  resources :users

#  root "landing#index"
   root "books#index" 

   resources :sitemap, only: %i[index], constraints: ->(req) { req.format == :xml }
end
