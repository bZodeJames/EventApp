Rails.application.routes.draw do
  resources :events
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'new', to: 'events#new'
  get 'create', to: 'events#create'
  get 'index', to: 'events#index'
  
  root to: "events#index"
end

