Rails.application.routes.draw do
  root to :tweet
  resources :tweets, only: :index
end
