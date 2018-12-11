Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :my do
    resources :reports, only: %i[index]
    resources :users, only: %i[index]
  end

  resources :users, except: %i[destroy] do
    resources :reports, only: %i[index new create]
  end
  resources :reports, only: %i[show edit update destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
