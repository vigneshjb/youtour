Youtour::Application.routes.draw do
  resources :users do
    resources :tours do
      resources :trips 
    end
  end
  resources :user_sessions

  root :to => 'pages#home'
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match '/' => 'pages#home'
  match 'home' => 'pages#home'
  match 'contact' => 'pages#contact'
  match 'aboutus' => 'pages#aboutus'

end
