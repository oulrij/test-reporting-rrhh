Rails.application.routes.draw do
  root to: 'pages#home'

  ## Custom devise controller to enable Managers to create new employees
  devise_for :users, :path => 'auth', :controllers => {:registrations => 'auth/registrations'}


  ## Nesting specific for Managers
  resources :users, only: %i[show] do
    resources :users, only: %i[index show edit update], path: 'team'
  end

  resources :users, only: %i[edit update]

  resources :reports, only: %i[show new create edit update]


  ## API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show] do
        resources :users, only: %i[index show edit update], path: 'team'
      end
    end
  end
end
