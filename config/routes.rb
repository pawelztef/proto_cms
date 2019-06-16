Rails.application.routes.draw do
  root to: 'welcome#index'

  # EXAMPLE CONFIGURATIONS DEVISE PATHS
  # devise_for :admins, :controllers => { :registrations => 'registrations' },
  #   :path => 'admins',
  #   :path_names => { :sign_in => 'login',
  #                    :sign_up => 'new',
  #                    :sign_out => 'logout',
  #                    :password => 'secret',
  #                    :confirmation => 'verification' }
   
  devise_for :admins, 
    :path => 'admins',
    :path_names => { :sign_in => 'login' }

  namespace :admins do
    resources :settings
    resources :dashboard
    resources :users
  end
end
