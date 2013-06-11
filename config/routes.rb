StoopApplication::Application.routes.draw do

   root :to => 'home#index'
   
   resources :items
   resources :sales
   resources :users
   resources :neighborhoods


  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
