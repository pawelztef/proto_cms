Rails.application.routes.draw do
  # TODO routes to clean up
  root to: "welcome#index"
  # scope "/admin" do
  # EXAMPLE CONFIGURATIONS DEVISE PATHS
  # devise_for :admins, :controllers => { :registrations => "registrations" },
  #   :path => "admins",
  #   :path_names => { :sign_in => "login",
  #                    :sign_up => "new",
  #                    :sign_out => "logout",
  #                    :password => "secret",
  #                    :confirmation => "verification" }
  # end
  #
  devise_for :users, 
    :path_names => { :sign_in => "login",
                     :sign_up => "new_user"}
  # Admin Namespace
  namespace :admin do
    resources :media do
      get 'stats', on: :member
      get "gallery", on: :collection
      post "update_image", constraints: { format: 'json' }
    end 
    resources :pages do
      member do
        get "draft"
      end
    end
    resources :categories
    resources :tags
    resources :settings
    resources :dashboard
    resources :users
  end

  # Previews Namespace
  namespace :previews do
    resources :pages, only: :show
    resources :posts, only: :show
  end

  # Front Namespace
  scope module: :front do
    resources :posts do
      resources :comments
    end
    resources :comments do
      resources :comments
    end
    get ":id", to: "pages#show", as: :page
  end

end
