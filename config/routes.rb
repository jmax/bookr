ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :authors
    admin.resources :categories
    admin.resources :tags
  end

  map.resource  :account, :controller => "users"
  map.resources :users
  map.resource  :user_session
  map.root      :controller => "user_sessions", :action => "new"
end

