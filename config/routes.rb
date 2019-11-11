Rails.application.routes.draw do

  get 'film/index'
  get 'film/search'
  get 'film/result'
  get 'film/persona'
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations',
    omniauth: 'users/omniauth',
    omniauth_callbacks: "omniauth_callbacks"}
   
  get 'users/sessions/new'
  get 'users/registrations/new'
  get 'tweets/index'
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
  get 'signup'     => 'registrations#new'
  put 'signup'     => 'registrations#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
