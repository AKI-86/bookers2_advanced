Rails.application.routes.draw do

  get 'searches/search'
  get 'relationships/create'
  get 'relationships/destroy'
  root to: "homes#top"
  get 'home/about', to: 'homes#about', as: 'about'
  get "search" => "searches#search"

  devise_for :users

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  resources :books, only: [:new, :edit, :create, :index, :show, :destroy, :update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :index, :update] do
    resource :relationships, only: [:create, :destroy]
  	  get "followings" => "relationships#followings", as: "followings"
  	  get "followers" => "relationships#followers", as: "followers"
  end

end
