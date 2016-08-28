Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}

  root to: "pages#landing_page"

  resources :users do
    collection do
      get :profiles
      get :list_donations
      post :add_donation
    end
  end

  resources :items

  resources :donations do
    member do
      put :accept_donation
    end
  end
end
