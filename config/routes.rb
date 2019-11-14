Rails.application.routes.draw do
  
  root             'static_pages#home'
  devise_for :users , controllers: {
    session: 'users/session', 
    registration: 'users/registration',
    omniauth: 'users/omniauth',
    omniauth_callbacks: "users/omniauth_callbacks",
    confirmations: 'users/confirmations'}  
  get 'home'           => 'static_pages#home'
  get 'about'          => 'static_pages#about'
  get 'help'           => 'static_pages#help'
  get 'contact'        => 'static_pages#contact'
  get 'profile/:id'    => 'users#show', as: 'user'
  get 'chat'       => 'chat#index'
  get 'persona/:id', to: 'film#persona', as: 'persona'
  get 'result/:id', to: 'film#result', as: 'result'
  post 'search'    => 'film#search'
  get 'search'     => 'film#search'
  get 'film'       => 'film#index'
  get 'film/persona'
  get 'film/result'
  get 'film/search'
  get 'film/index'
  get 'chat/index'
  mount ActionCable.server => '/cable'
  resources :tweets
  resources :users, :only =>[:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
