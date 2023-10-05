Rails.application.routes.draw do
  resources :student_subscriptions
  resources :notifications
  resources :comment_children
  resources :comment_parents
  resources :wishlists
  resources :content_media
  resources :contents
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
