Rails.application.routes.draw do
  namespace :admin do
    root to: 'dashboard#index'
    get :dashboard, to: 'dashboard#index', as: :dashboard
    resources :categories
    resources :users
    resource :profile do
      get 'edit_password'
      post 'update_password'
    end
    get 'signin', to: 'sessions#new', as: :signin
    post 'signin', to: 'sessions#create'
    get 'signout', to: 'sessions#destroy', as: :signout
    get 'errors/403', to: 'errors#error_403', as: :error_403
    resources :errors
    get '*not_found', to: 'errors#error_404'
  end
end
