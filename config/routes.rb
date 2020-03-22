Rails.application.routes.draw do
  devise_for :users
  root 'spots#index'
  resources :spots, only: [:index, :new, :create, :show]
  resources :prefectures, only: :show
end
