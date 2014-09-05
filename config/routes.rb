Groupme2::Application.routes.draw do
  devise_for :users
  #resources :groups
  namespace :account do
    resources :groups
    resources :posts
  end

  resources :groups do
  	member do
  		post :join
  		post :quit
  	end
  	
  	resources :posts
  end
  #root :to => 'high_voltage/pages#show', :id => 'welcome'
  root :to => 'groups#index'

end
