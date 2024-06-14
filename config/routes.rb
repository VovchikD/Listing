Rails.application.routes.draw do
  devise_for :admin, path: '', path_names: {
    sign_in: 'admin',
    registration: 'admin/sign_up'
  }, controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :listings do
      member do
        post :approve
        post :reject
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
