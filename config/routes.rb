Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get 'home/index'
  root to: "home#index"
  resources :users
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_scope :user do
    get '/cms', to: 'admins/sessions#new'
  end
end
