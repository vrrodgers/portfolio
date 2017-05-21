Rails.application.routes.draw do
 resources :album
 resources :category
 resources :contact, only: [:new, :create]
 root to: "pages#home"
 get 'about-me' to: 'pages#about_me' 
end
