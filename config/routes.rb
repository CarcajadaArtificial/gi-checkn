Rails.application.routes.draw do
  # Event Pages
  get 'event/new',                to: 'events#new',           as: 'event_new'
  get 'events/:id',               to: 'events#show',          as: 'event_home'
  get 'events/:id/edit',          to: 'events#edit',          as: 'event_edit'
  get 'events/:id/preregister',   to: 'events#preregister',   as: 'preregister'
  get 'events/:id/checkout',      to: 'events#checkout',      as: 'checkout'
  get 'events/:id/register',      to: 'events#register',      as: 'register'
  get 'events/:id/sale',          to: 'events#sale',          as: 'sale'
  get 'events/:id/dashboard',     to: 'events#dashboard',     as: 'dashboard'
  get 'events/:id/manager',       to: 'events#manager',       as: 'manager'
  get 'events/:id/staff',         to: 'events#staff',         as: 'staff'
  get 'events/:id/database',      to: 'events#database',      as: 'database'
  # Event Actions
  post 'events',                  to: 'events#create',        as: 'event_create'
  put 'events/:id',               to: 'events#update',        as: 'event_update'
  delete 'events/:id',            to: 'events#destroy',       as: 'event_delete'
  # Ticket actions
  post 'tickets',                 to: 'tickets#create',       as: 'ticket_create'
  # Static Pages
  root            to: "pages#index"
  get 'login',    to: 'pages#login',    as: 'login'
  get 'profile',  to: 'pages#profile',  as: 'profile'
  get 'error404', to: 'pages#error404', as: 'error404'
  # Devise
  devise_for :users
end
