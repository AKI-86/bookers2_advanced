Rails.application.routes.draw do

  root to: "homes#top"
  get 'home/about', to: 'homes#about', as: 'about'

  devise_for :users

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  resources :books, only: [:new, :edit, :create, :index, :show, :destroy, :update]
  resources :users, only: [:show, :edit, :index, :update]
end
