Rails.application.routes.draw do
  
  post '/rate' => 'rater#create', as: 'rate'
  devise_for :users
  #get 'persons/profile'
  #get 'persons/profile', as: 'users_root'
  resources   :articles do
    resources :comments
    resources :ratings, only: [:new, :create]                           # установили возможные экшены

  end
  root 'welcome#index'
  post 'check_nickname', to: 'welcome#check_nickname'

end

