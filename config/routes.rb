Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets
  resources :users, only: [:index, :show] do
    member do
      get 'mypage'
    end  
  end  
  resources :areas, only: [:new, :create, :edit, :create] do
    member do
      get 'part'
    end
  end    
end
