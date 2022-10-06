Rails.application.routes.draw do
  devise_for :users
  root "recipes#public"
  match 'public_recipes' => 'public_recipes#index', as: :public_recipes, via: :get
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :recipes, except: :update do
    resources :recipefoods
  end
  resources :foods, except: :update
  
  resource :shopping_lists, only: [:index]
  get 'recipes/:recipe_id/generate_shopping_list', :to => 'shopping_lists#new'
  post 'recipes/:recipe_id/generate_shopping_list', :to => 'shopping_lists#create'
  post 'recipes/new', :to => 'recipes#create'
  post 'recipes/:recipe_id/recipe_food/new', :to => 'recipe_foods#new'
  # Defines the root path route ("/")
end