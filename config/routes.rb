Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  get 'pages/index'
  get 'about', to: 'pages#about'

  resources :articles, except: %i[destroy] do
    resource :comments, only: %i[create]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
