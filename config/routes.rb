Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post '/rate' => 'rater#create', as: 'rate'
  devise_for :users
  #get 'persons/profile'
  #get 'persons/profile', as: 'users_root'
  resources   :articles do
    resources :comments
    resources :ratings, only: [:new, :create]                           # установили возможные экшены

  end
  resources :users

  root 'welcome#index'
  post 'check_nickname', to: 'welcome#check_nickname'

end

