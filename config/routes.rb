Rails.application.routes.draw do

  root 'homes#index'
  resources :recipes, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:show] do
    resources :recipes
  end

  resources :recipes do
    resources :ingredients
    resources :directions
    resources :recipe_ingredients
  end
  # in case the oauth provider doesn't provide a verified email address
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


end
