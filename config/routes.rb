Rails.application.routes.draw do
  devise_for :users
  root 'spots#index'
  resources :spots
  resources :prefectures, only: :show
  resources :users, only: :show
end
