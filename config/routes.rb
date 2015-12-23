Rails.application.routes.draw do
  resources :forms
  post 'forms/create_send_form_message', to: 'forms#create_send_form_message'
  get 'forms/emails_sent_by_form', to: 'forms#emails_sent_by_form'
  get 'forms/show_for_pdf/:id', to: 'forms#show_for_pdf', as: 'show_for_pdf'


  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, :controllers => { invitations: 'users/invitations' }
  resources :users
end
