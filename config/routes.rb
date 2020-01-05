Rails.application.routes.draw do
  root to: 'front/publishables#index'

  # Devise Paths Configurations Example
  # scope "/admin" do
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
    
  ### Admin Namespace ###
    
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
    namespace :settings do
      resource :site do
        collection do 
          get 'destroy_img'
        end
      end
      resources :publishable_groups
    end
    resources :dashboard
    resources :users
    resources :posts
    #resources :publishable_groups
    get '/:publishable_group_id', to: 'publishable_groups#show', as: :publishable_group
    # get '*publishable', to: 'publishables#show', as: :page
  end

  ### Previews Namespace ###
   
  namespace :previews do
    resources :pages, only: :show
    resources :posts, only: :show
  end

  ### Front Namespace ###
   
  scope module: :front do
    resources :readers
    resources :posts do
      resources :comments, module: :posts
    end
    resources :comments do
      resources :comments
    end

    resources :publishable_groups do
      resources :publishable
    end

    # get '*publishable/comment', to: 'publishables#new_comment', as: :new_comment_publishable
    # get '*publishable/:post_id', to: 'posts#show', as: :post_page
    # get '*publishable', to: 'publishables#show', as: :page

  end
end
