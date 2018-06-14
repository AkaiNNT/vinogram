Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    # get '/', to: 'users/sessions#new'
  end
  get 'home/index'
  root to: "home#index"
  resources :users
end
