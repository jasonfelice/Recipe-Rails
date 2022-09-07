Rails.application.routes.draw do
  get 'user/index'
  get 'user/show'
  devise_for :users
  root "recipes#public"
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :users do
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    end
  end
end
