Rails.application.routes.draw do
  get 'f/:formid', to: 'forms#show', as: 'form' 

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
