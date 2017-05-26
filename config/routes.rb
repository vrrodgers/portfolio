Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
 resources :albums
 resources :categories
 resources :contacts, only: [:new, :create]
 root to: "pages#home"
 get 'about-me' => 'pages#about_me' 
end
