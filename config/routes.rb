Rails.application.routes.draw do
  root to: 'welcome#index'

  scope '/admin' do
    # EXAMPLE CONFIGURATIONS DEVISE PATHS
    # devise_for :admins, :controllers => { :registrations => 'registrations' },
    #   :path => 'admins',
    #   :path_names => { :sign_in => 'login',
    #                    :sign_up => 'new',
    #                    :sign_out => 'logout',
    #                    :password => 'secret',
    #                    :confirmation => 'verification' }
    devise_for :users, 
      :controlers => {:registrations => 'registrations'},
      :path => 'users',
      :path_names => { :sign_in => 'login' }
  end

  namespace :admin do
    resources :settings
    resources :dashboard
    resources :users
  end
end
