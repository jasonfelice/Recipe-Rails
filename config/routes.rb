Rails.application.routes.draw do
  get 'foods/index'
  delete 'inventory_foods/:id/destroy/:food_id', to: 'inventory_foods#destroy'
  get 'inventory_foods/:id/new', to: 'inventory_foods#new'
  post 'inventory_foods/:id/create', to: 'inventory_foods#create'
  resources :foods, only:[:index,:new,:create,:destroy]
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
