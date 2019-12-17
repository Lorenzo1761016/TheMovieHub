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
  get 'contact'        => 'static_pages#contact'
  get 'chat'           => 'chat#index'
  get 'persona/:id', to: 'film#persona', as: 'persona'
  get 'movie/:id', to: 'film#result', as: 'result'
  post 'search'    => 'film#search'
  get 'search'     => 'film#search'
  get 'index'       => 'film#index'
  get 'tv/:id', to: 'film#tv', as: 'tv'
  get 'tv/:id/season/:number', to: 'film#season', as: 'season'
  get 'tv/:id/season/:number/episode/:episode', to: 'film#episode', as: 'episode'
  get 'film/persona'
  get 'film/result'
  get 'film/search'
  get 'film/index'
  get 'chat/index'
  get 'film/tv'
  get '/unban/:id', to: 'users#unban', as: 'unban'
  get '/ban/:id', to: 'users#ban', as: 'ban'
  get 'destroy/:id', to: 'users#destroy', as: 'destroy' 

  mount ActionCable.server => '/cable'

  resources :films do
    resources :comments
  end

  resources :tvs do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  resources :tweets
  resources :users, :only =>[:show, :index, :update, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
