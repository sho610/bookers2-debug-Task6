Rails.application.routes.draw do
  get 'favorite/create'
  get 'favorite/destroy'
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about"
  get "/search", to: 'searchs#search'

  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end