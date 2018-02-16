Rails.application.routes.draw do
  devise_for :users
  resources :events do 
  	resources :participations, only: [:create, :destroy]
  end 

  root to: 'events#index'
end
