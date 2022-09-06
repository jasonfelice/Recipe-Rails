Rails.application.routes.draw do
  get 'user/index'
  get 'user/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#index"
end
