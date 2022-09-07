Rails.application.routes.draw do
  get 'user/index'
  get 'user/show'
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  devise_for :users
  root "recipes#public"
end
