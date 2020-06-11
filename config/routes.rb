Rails.application.routes.draw do
  devise_for :users
  # root to: 'tweets#index'
  root to: 'users#mypage'
  resources :tweets
  resources :users, only: [:index, :show] do
    member do
      get 'mypage'
      get 'gmap'
    end  
  end  
  resources :areas, only: [:new, :create, :edit, :create] do
    member do
      get 'part'
    end
  end   
  get 'maps/index' 
  resources :maps, only: [:index]
end
