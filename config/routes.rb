Rails.application.routes.draw do
  resources :events
  
  resources :events do
    member do
      get :register
    end
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  devise_for controllers: { registrations: 'registrations' }

  root to: 'events#index'
end
