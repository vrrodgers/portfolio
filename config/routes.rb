Rails.application.routes.draw do
 resources :albums
 resources :categories
 resources :contacts, only: [:new, :create]
 root to: "pages#home"
 get 'about-me' => 'pages#about_me' 
end
