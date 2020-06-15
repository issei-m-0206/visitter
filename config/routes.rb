Rails.application.routes.draw do
  devise_for :users

  root to: 'users#mypage'
  resources :tweets
  resources :users, only: [:index, :show] do
    member do
      get 'mypage'
      get 'gmap'
      get :following, :followers
      get 'follow_index'
    end  
  end  
  resources :areas, only: [:new, :create, :edit, :create] do
    member do
      get 'part', to: 'areas#part'
    end
  end   
  get 'maps/index' 
  resources :maps, only: [:index]
  resources :relationships, only: [:create, :destroy]
end
