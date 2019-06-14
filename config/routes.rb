Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :admins

  namespace :admins do
    resources :settings
  end
end
