Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users
  root to: "compilations#index"
  resources :compilations
  get '/advancedsearch', to: 'compilations#advancedsearch'
  get '/activityfeed', to: 'items#activity_feed'
end
