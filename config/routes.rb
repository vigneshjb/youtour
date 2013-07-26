Youtour::Application.routes.draw do

  resources :users do
    resources :tours do
      resources :trips 
    end
  end

end
