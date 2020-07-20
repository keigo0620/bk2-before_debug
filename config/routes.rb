Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'
  resources :books , only: [:create, :index, :show, :edit, :index, :update , :destroy]
  resources :users , only: [:show, :edit, :update, :edit, :index]
end