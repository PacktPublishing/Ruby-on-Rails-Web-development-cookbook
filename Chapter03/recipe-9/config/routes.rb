Rails.application.routes.draw do
  concern :authenticatable do
    resource :session
    resources :passwords, param: :token
    resources :users, only: [:new, :create]
  end

  constraints subdomain: ["admin", ""] do
    concerns :authenticatable
  end

  constraints ->(req) { User.exists? subdomain: req.subdomain } do
    concerns :authenticatable

    resources :projects, only: [:index, :show, :new, :create] do
      resources :todos, only: [:create, :update]
    end

    get "/" => "projects#index", :as => :project_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Admin interface
  constraints subdomain: "admin" do
    namespace "admin", path: "" do
      # Admin dashboard shows list of users
      resources :users, only: [:index, :edit, :update, :destroy]
      resources :projects, only: [:index, :edit, :update, :destroy]
      resources :todos, only: [:index, :edit, :update, :destroy]

      get "/" => "users#index", :as => :admin_root
    end
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # We will need to add www here
  constraints subdomain: "" do
    root to: "home#index"
  end
end
