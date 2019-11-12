Rails.application.routes.draw do
  root             'static_pages#home'
  devise_for :users , controllers: {
    session: 'users/session', 
    registration: 'users/registration',
    omniauth: 'users/omniauth',
    omniauth_callbacks: "users/omniauth_callbacks",
    confirmations: 'users/confirmations'}  

  get 'home'       => 'static_pages#home'
  get 'about'      => 'static_pages#about'
  get 'help'       => 'static_pages#help'
  get 'contact'    => 'static_pages#contact'
  get 'index'      => 'tweets#index'
  post 'create'    => 'tweets#create'
  
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
