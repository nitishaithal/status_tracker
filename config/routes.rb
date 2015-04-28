Rails.application.routes.draw do
  get 'chat/start_conversation'
  
  get 'users/new'

  devise_for :users
  root to: "home#index"
  resources :dashboard do
    collection do
      get 'search_users'
    end
  end
  resources :posts do 
  	resources :comments
  end
  resources :projects do
    member do
      post 'add_members'
    end
  end
  resources :goals
  resources :milestones
  resources :intents
  match '/edit' => 'home#edit', :as => :edit, :via => [:get, :post]
  match ':controller(/:action(/:id))', :via => [:get, :post]

  #get 'projects/show'
  #match '/index' => 'posts#index', :as => :edit, :via => [:get, :post]
end
