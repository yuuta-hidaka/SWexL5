Rails.application.routes.draw do
    resources :users
    
    get 'get_users/:id', to: 'users#get_users'
    
    resources :tweet
    root 'tweet#index'
    get 'get_tweet/:id', to: 'tweet#get_tweet'
    
    get 'top/main'
    post 'top/login'
    get 'top/logout'
    
    resources :likes
    root 'likes#index'
    get 'likes/index'
end
