Chatter::Application.routes.draw do




  match 'login', :to => 'messages#login'
  match 'create_username', :to => 'messages#create_username'

  resources :messages
  root to: 'messages#login'

 


end
