Rails.application.routes.draw do
  
  get 'users/index'
  get 'messages/index'
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
end
