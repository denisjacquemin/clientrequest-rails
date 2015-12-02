Rails.application.routes.draw do
  resources :forms
  post 'forms/send', to: 'forms#send_by_email', as: 'send_by_email'  

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
