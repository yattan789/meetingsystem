Rails.application.routes.draw do
  resources :actions
  resources :moms
  resources :meets
  devise_for :users
  resources :agendas
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/about'
  get 'home/new'
  get 'home/delete'
  get 'home/see_your'

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  
  # Defines the root path route ("/")
  # root "articles#index"
end
