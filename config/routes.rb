Groupme2::Application.routes.draw do
  devise_for :users
  #resources :groups
  resources :groups do
  	resources :posts
  end
  #root :to => 'high_voltage/pages#show', :id => 'welcome'
  root :to => 'groups#index'

end
