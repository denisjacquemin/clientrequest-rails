Rails.application.routes.draw do
  resources :forms
  #get 'f/:formid', to: 'forms#show', as: 'form'
  #get 'allforms', to: 'forms#index' 

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
