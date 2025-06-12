Rails.application.routes.draw do
  get 'task_templates/index'
  get 'task_templates/new' 
  get 'task_templates/create'
  devise_for :users
  root to: "homes#index"
  post 'register_task_logs', to: 'homes#register', as: 'register_task_logs'
  resources :children, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :task_logs, only: [:new, :create, :show, :destroy, :edit, :update] do
      collection do
        get 'album'
        get 'new_memory'
      end
    end
  end
  resources :task_templates
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
