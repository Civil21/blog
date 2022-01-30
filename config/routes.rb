Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#index'
  get 'pages/index'
  get 'about', to: 'pages#about'

  resources :articles, except: %i[destroy]

  resources :comments, only: %i[destroy]
  post ":commentable_type/:commentable_id/comment", to: "comments#create", as: :commentable_comment

  post ":object_type/:object_id/like", to: "likes#create", as: :like_object

  resources :categories,only: %i[index show]


  resource :profile, only: %i[show]

end
