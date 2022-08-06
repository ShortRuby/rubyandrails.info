Rails.application.routes.draw do
  # get 'landing/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "/pages/*page", to: "pages#show"

  resources :authors, path: 'people' 
  # resources :courses

  namespace :books do
    resources :free, only: [:index, :show]
  end
  resources :books 

  get 'books/:year', to: 'books#by_year', as: 'by_years'
  resources :tags, path: 'learn'
  resources :users

#  root "landing#index"
   root "books#index" 

   resources :sitemap, only: %i[index], constraints: ->(req) { req.format == :xml }
end
