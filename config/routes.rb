StoopApplication::Application.routes.draw do

   root :to => 'home#index'
   resources :items
   resources :sales
   resources :neighborhoods

end
