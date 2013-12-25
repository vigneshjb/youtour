Youtour::Application.routes.draw do
get 'fb_login', to: 'fb_sessions#new_fb_session'
  resources :users do
    get 'reqs', to: 'trips#reqs', :action => ":index", :controller => ":trips"
    get 'change_password', to: 'users#change_password', :action => ":edit", :controller => ":users"
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
