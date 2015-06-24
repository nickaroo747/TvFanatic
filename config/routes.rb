Rails.application.routes.draw do
  root "users#new"

  get "users" => "movies#index"
  get "users/:id" => "users#show", as: :user
  post "users" => "users#create"
  get "signup" => "users#new"
  get "users/:id/edit" => "users#edit", as: :edit_user
  patch "users/:id" => "users#update"

  #routes for login
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  #Routes for Getting and Creating Movie
  get "movies/" => "movies#index"
  get "movies/new" => "movies#new", as: :new_movie
  post "movies/" => "movies#create"

  #Routes for Showing and Editing / Deleting Movie
  get "movies/:id" => "movies#show", as: :movie
  get "movies/:id/edit" => "movies#edit", as: :edit_movie
  patch "movies/:id" => "movies#update"
  delete "movies/:id" => "movies#destroy"


  post "movies/:id/reviews" => "reviews#create", as: :movie_reviews
  delete "reviews/:id" => "reviews#destroy"


  
end
