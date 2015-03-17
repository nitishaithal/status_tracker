Rails.application.routes.draw do
  get 'users/new'

  devise_for :users
  root to: "home#index"
  resources :dashboard
  resources :posts do 
  	resources :comments
  end
  resources :projects do
    member do
      post 'add_members'
    end
  end
  match '/edit' => 'home#edit', :as => :edit, :via => [:get, :post]
  match ':controller(/:action(/:id))', :via => [:get, :post]
  #get 'projects/show'
  #match '/index' => 'posts#index', :as => :edit, :via => [:get, :post]
end
