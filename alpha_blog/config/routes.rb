Rails.application.routes.draw do



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'



  # for adding articles routes to pages, check the rake routes...
  resources :articles





  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  #resources :users


  #for login route
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  #for logout route
  delete 'logout', to: 'sessions#destroy'


  #for categories
  resources :categories, except: [:destroy]
end
