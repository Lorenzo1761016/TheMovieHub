Rails.application.routes.draw do

  get 'film/index'
  get 'film/search'
  get 'film/result'
  get 'film/persona'
  get 'sessions/new'
  get 'users/new'
  get 'tweets/index'
  root             'static_pages#home'

  get 'home'       => 'static_pages#home'
  get 'film'       => 'film#index'
  get 'search'     => 'film#search'
  post 'search'    => 'film#search'
  get 'result/:id', to: 'film#result', as: 'result'
  get 'persona/:id', to: 'film#persona', as: 'persona'
  get 'about'      => 'static_pages#about'
  get 'help'       => 'static_pages#help'
  get 'contact'    => 'static_pages#contact'
  get 'index'      => 'tweets#index'
  post 'create'    => 'tweets#create'
  get 'signup'     => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :tweets
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
