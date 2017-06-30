Chatter::Application.routes.draw do




  match 'login', :to => 'messages#login'

  resources :messages
  root to: 'messages#index'

 


end
