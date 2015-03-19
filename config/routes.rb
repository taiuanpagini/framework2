Rails.application.routes.draw do

  root to: 'home#index'
  #devise_for :users

  devise_for :users, :path => "admin", :path_names => { :sign_in => 'login', :sign_out => 'sair' }

  resources :users

  namespace :admin do

    root to: "home#index"

    resources :users

  end  
  
end

