Rails.application.routes.draw do
  resources :youtubes do
    resources :lessons, module: :youtubes
  end

  resources :communities
  resources :events
  resources :screencasts
  resources :newsletters
  resources :podcasts
  # get 'landing/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "/pages/*page", to: "pages#show"
  get "/guides/*page", to: "guides#show"

  resources :authors, path: 'people' 

  resources :courses

  namespace :books do
    resources :free, only: [:index, :show]
  end
  resources :books 

  resources :tags, path: 'learn'
  resources :users

 # root "pages#show", page: "index"
   root "books#index" 

   resources :sitemap, only: %i[index], constraints: ->(req) { req.format == :xml }
end
