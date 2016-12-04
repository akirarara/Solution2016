Chatsystem::Application.routes.draw do
  get 'rooms/show'

    resources :users, only: [:index, :show, :new, :edit, :create, :update]
    resources :sessions, only: [:new, :create, :destroy]
    
    match 'signup', to: 'users#new', via: 'get'
    match 'signin', to: 'sessions#new', via: 'get'
    match 'signout', to: 'sessions#destroy', via: 'delete'
    match 'chatroom', to: 'rooms#show', via: 'get'
    
    root 'users#index'
    
    mount ActionCable.server => '/cable' # Action Cable の有効化
end
