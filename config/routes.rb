Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}

  resources :users do
    collection do
      get :profiles
    end
  end

  root to: "pages#landing_page"

  resources :users do
    collection do
      get :list_donations
      post :add_donation
    end
  end

  resources :donations
end
