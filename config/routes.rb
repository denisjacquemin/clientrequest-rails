Rails.application.routes.draw do
  resources :forms
  post 'forms/send_by_email', to: 'forms#send_by_email', as: 'send_by_email'
  get 'forms/emails_sent', to: 'forms#emails_sent', as: 'emails_sent'

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
