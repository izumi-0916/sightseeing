Rails.application.routes.draw do
  devise_for :users
  root 'spots#index'
  resources :spots do
    resources :likes, only: [:create, :destroy]
  end
  resources :prefectures, only: :show
  resources :users, only: :show
end
