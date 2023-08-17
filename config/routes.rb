Rails.application.routes.draw do
root 'pages#home'
get 'about', to: 'pages#about'
resources :articles
get 'signup', to: 'users#new'
resources :users, except: [:new]
get 'login', to: 'seasions#new'
post 'login', to: 'seasions#create'
delete 'logout', to: 'seasions#destroy'
end
