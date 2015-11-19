Rails.application.routes.draw do
  resources :photos, except: [:edit]

  devise_for :users
  root to: 'visitors#index'
end
