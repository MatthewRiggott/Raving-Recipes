Rails.application.routes.draw do
  resources :directions
  resources :ingredients
  resources :recipe_ingredients
  resources :recipes
  root 'homes#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  # in case the oauth provider doesn't provide a verified email address
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


end
