Rails.application.routes.draw do

  root to:  'pages#home'
 

  devise_for :users,
             :path => '',
             :path_names => { :sign_in => 'login', :edit => 'profile', :sign_out => 'signout'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks', :registrations => 'registrations'}

  resources :users, only: [:show]
  resources :rooms
  resources :photos

end
