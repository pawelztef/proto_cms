Rails.application.routes.draw do
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
   
  devise_for :users,
    :path => 'users',
    :controllers => { :sessions => "admin/users/sessions",
                      :passwords => "admin/users/passwords",
                      :registrations => "admin/users/registrations",
                      :unlocks => "admin/users/unlocks",
                      :confirmations => "admin/users/confirmations" },
    :path_names => { :sign_in => "login",
                     :sign_up => "new_user"}

  devise_for :readers, 
    :path => 'readers',
    :controllers => { :sessions => "front/readers/sessions",
                      :passwords => "front/readers/passwords",
                      :registrations => "front/readers/registrations",
                      :unlocks => "front/readers/unlocks",
                      :confirmations => "front/readers/confirmations"},
    :path_names => { :sign_in => "login",
                     :sign_up => "new_reader"}

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
    resources :posts
    resources :comments
    resources :categories
    resources :tags
    resources :settings
    resources :dashboard
    resources :users
    resources :posts
  end

  # Previews Namespace
  namespace :previews do
    resources :pages, only: :show
    resources :posts, only: :show
  end

  # Front Namespace
  scope module: :front do
    resources :readers
    resources :posts do
      resources :comments, module: :posts
    end
    resources :comments do
      resources :comments
    end
    get ":id", to: "pages#show", as: :page
  end

end
