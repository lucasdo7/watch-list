Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"

  resources :movies, only: %i[index show create new]

  resources :lists, only: %i[index show create new]
end
