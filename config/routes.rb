Youtour::Application.routes.draw do

  resources :users do
    resources :tours do
      resources :trips 
    end
  end
  resources :user_sessions

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => 'user_sessions#new'

end
