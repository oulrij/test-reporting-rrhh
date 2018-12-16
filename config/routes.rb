Rails.application.routes.draw do
  root to: 'pages#home'

  ## Custom devise controller to enable Managers to create new employees
  devise_for :users, :path => 'auth', :controllers => {:registrations => 'auth/registrations'}


  ## Nesting specific for Managers
  resources :users, only: %i[show] do
    # resources :reports, only: %i[show edit update]
    resources :users, only: %i[index show edit update], path: 'team'
  end

  resources :users, only: %i[edit update]

  resources :reports, only: %i[show new create edit update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
