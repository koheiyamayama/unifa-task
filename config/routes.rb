Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :pictures, only: [:index, :new, :create]
  get 'oauth/callback', to: 'sessions#callback'
  get 'pictures/:id/tweet', to: 'pictures#tweet', as: :picture_tweet
end
