Rails.application.routes.draw do
  get 'landing/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :authors, path: 'people' 
  resources :courses
  resources :books
  get 'books/:year', to: 'books#by_year', as: 'by_years'
  resources :tags, path: 'learn'
  resources :users

#  root "landing#index"
   root "books#index" 

  constraints(host: /^(?!www\.)/i) do
    get '(*any)' => redirect { |_params, request|
      URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s
    }
  end
end
