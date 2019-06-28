Rails.application.routes.draw do
  root to: 'welcome#index'

  # scope '/admin' do
    # EXAMPLE CONFIGURATIONS DEVISE PATHS
    # devise_for :admins, :controllers => { :registrations => 'registrations' },
    #   :path => 'admins',
    #   :path_names => { :sign_in => 'login',
    #                    :sign_up => 'new',
    #                    :sign_out => 'logout',
    #                    :password => 'secret',
    #                    :confirmation => 'verification' }
  # end
  #
    devise_for :users, 
               :path_names => { :sign_in => 'login',
                                :sign_up => 'new_user'}

  namespace :admin do
    resources :settings
    resources :dashboard
    # resources :users_admin, :controller => 'users'
    resources :users
  end
end
