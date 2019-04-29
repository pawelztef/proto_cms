Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :caregivers
  devise_for :admins

  resources :caregivers

  namespace :admins do
    resources :settings
  end
end
