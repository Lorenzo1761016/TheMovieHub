Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :tweets

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tweets/index'
  post 'tweets/show'
end
