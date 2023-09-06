Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users
  root to: 'compilations#index'
  resources :compilations, path: :collections do
    resources :items, only: %i[edit update new create]
  end
  resources :items, only: %i[destroy]
  get '/advancedsearch', to: 'compilations#advancedsearch'
  get '/activityfeed', to: 'items#activity_feed'
  resources :items, only: %i[] do
    resources :comments, only: %i[ new create show ]
    resources :likes, only: %i[create destroy]
  end
  resources :follows, only: %i[create destroy]
  
end
