Rails.application.routes.draw do
  devise_for :admin, path: 'admin', controllers: {
    sessions: 'admin/sessions',
    registration: 'admin/registrations'
  }

  namespace :admin do
    resources :listings, only: [:index, :show] do
      member do
        patch :approve
        patch :reject
      end
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

  namespace :api do
    namespace :v1 do
      resources :listings, only: [:index, :show, :create, :destroy]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
