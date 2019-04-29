Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post '/rate' => 'rater#create', as: 'rate'
  devise_for :users,
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
             },
             controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations',
                 # omniauth_callbacks: 'users/omniauth_callbacks'
             }

  #get 'persons/profile'
  #get 'persons/profile', as: 'users_root'
  resources   :articles do
    resources :comments
    resources :ratings, only: [:new, :create]                           # установили возможные экшены
    post 'add_to_favorites', on: :member
    put 'delete_to_favorites',on: :member
    resources :reports
    get 'add_report'
  end

  resources :users do
    get 'my_favorites', on: :member
  end

  resources :conversations do
    resources :messages
    get 'edit_message'
  end

  namespace :v1, defaults: { format: :json } do
    resources :articles
    resources :users
  end

  root 'welcome#index'
  post 'check_nickname', to: 'welcome#check_nickname'
  get 'game', to: 'welcome#game'

end

