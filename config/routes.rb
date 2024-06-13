Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :listings do
      put :approve, on: :member
      put :reject, on: :member
    end
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :admins

  namespace :api do
    namespace :v1 do
      resources :listings, only: [:index, :show, :create, :destroy]
    end
  end

  root 'api/v1/listings#index'

  get "up" => "rails/health#show", as: :rails_health_check
end
