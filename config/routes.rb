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
  # get 'home/index'
  root to: "posts#index"


  resources :users do
    get 'search', to: 'users#search_navbar', on: :collection
    get 'suggested', to: 'users#suggested', on: :collection
    put 'follow', to: 'users#follow', on: :member
    delete 'destroy_following', on: :member
    put 'approve', to: 'users#approve_follower', on: :member
  end

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
