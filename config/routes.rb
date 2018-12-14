Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, :path => 'auth', :controllers => {:registrations => 'auth/registrations'}

  resources :users, only: %i[show] do
    resources :reports, only: %i[show edit update destroy]
    resources :users, only: %i[index show edit update], path: 'team'
    # get :my_index, on: :member
  end

  resources :users, only: %i[edit update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
