Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :brands, only: :index
  resources :features, only: [:index]
  resources :feature_values, only: [:index]
  resources :orders, only: [:index, :create]
end
