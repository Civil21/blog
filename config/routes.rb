Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  get 'pages/index'
  get 'about', to: 'pages#about'

  resources :articles, except: %i[destroy]

  resources :comments, only: %i[destroy]

  post ":commentable_type/:commentable_id/comment", to: "comments#create", as: :commentable_comment

  resource :profile, only: %i[show]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
