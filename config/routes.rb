Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions: 'employees/sessions',
    passwords: 'employees/passwords',
    registrations: 'employees/registrations',
    confirmations: 'employees/confirmations'
  }

  resources :accounts
  resources :employees, only: [:show, :edit, :update]
  resources :contacts
  resources :opportunities
  resources :payment_gateways do
    patch :update_audit_status, on: :member
  end
  resources :tasks
  resources :quotes
  resources :settings
  resources :raw_material_prices do
    collection do
      get :download_price_list
    end
  end
  resources :locations
  resources :territory_masters
  resources :territory_locations
  resources :user_territories
  resources :sales_office
  resources :glass_items do
    collection do
      get :download_price_list
    end
  end

  resources :reinforcement_prices do
    collection do
      get :download_price_list
    end
  end
  resources :hardware_prices do
    collection do
      get :download_price_list
    end
  end

  resources :profile_rm_item_details, only: [:index, :edit, :update] do
    collection do
      get :download_price_list
    end
  end

  # post 'raw_material_prices/upload_price_list', :to => 'raw_material_prices#upload_price_list'
  resources :window_doors
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'home#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
