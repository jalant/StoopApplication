StoopApplication::Application.routes.draw do

  resources :neighborhoods

  root :to => 'home#index'

end
