Rails.application.routes.draw do
  get 'favorite/create'
  get 'favorite/destroy'
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about"
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end