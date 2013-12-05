Leprechaun::Application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :dashboard

  resources :lists do
  	resources :items#, :comments
  end

end
