Rails.application.routes.draw do
  resources :events
  # Static Pages
  root to: "pages#index"
  get 'login', to: 'pages#login', as: 'login'
  get 'profile', to: 'pages#profile', as: 'profile'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
