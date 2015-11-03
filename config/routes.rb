Rails.application.routes.draw do
  resources :posts
  get 'static_page/index'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_page#index'
  resources :users
end
