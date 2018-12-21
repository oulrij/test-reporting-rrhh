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


  ## API routes ----------------------------------------
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users,
                path: 'auth',
                controllers: {
                  registrations: 'api/v1/auth/registrations'
                },
                skip: %i[sessions password]
      resources :users, only: %i[show update] do
        resources :users, only: %i[index show update], path: 'team'
      end
      # resources :users, only: %i[update]
      resources :reports, only: %i[show create update]
    end
  end
end
