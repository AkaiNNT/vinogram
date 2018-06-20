Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :posts do
    resources :comments, controller: 'posts/comments'
    resources :likes, controller: 'posts/likes'
  end
  get 'home/index'
  root to: "home#index"
  resources :users

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do
    resources :users
    resources :posts
    resources :comments
    root to: 'dashboards#index'
  end
end
