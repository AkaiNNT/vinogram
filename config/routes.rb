Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :posts do
    resources :likes, controller: 'posts/likes'
  end
  get 'home/index'
  root to: "home#index"
  resources :users
end
