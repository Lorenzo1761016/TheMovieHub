Rails.application.routes.draw do
  root             'static_pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations',
    omniauth: 'users/omniauth',
    omniauth_callbacks: "users/omniauth_callbacks"}  


  get 'home'       => 'static_pages#home'
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
