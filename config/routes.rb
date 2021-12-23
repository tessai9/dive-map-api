# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show update destroy]
  post :user, to: 'users#create'
  resources :regions, only: %i[show update destroy] do
    resources :points, only: %i[show update destroy]
    get :point, to: 'points#index'
    post :point, to: 'points#create'
  end
  get :region, to: 'regions#index'
  post :region, to: 'regions#create'
  post :login, to: 'sessions#create'
end
