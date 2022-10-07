Rails.application.routes.draw do
  devise_for :users
  root "recipes#public"
  match 'public_recipes' => 'public_recipes#index', as: :public_recipes, via: :get
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :recipes do
    resources :recipe_foods, except: :update
    resources :shopping_lists, only: [:index]
  end
  resources :foods, except: :update
  
  post 'recipes/new', :to => 'recipes#create'

end