Rails.application.routes.draw do
  resources :events
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'new', to: 'events#new'
  get 'create', to: 'events#create'
  get 'index', to: 'events#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for controllers: { registrations: 'registrations' }
end
