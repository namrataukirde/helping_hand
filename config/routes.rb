Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}

  root to: "pages#landing_page"

  resources :users do
    collection do
      get :profiles
      get :list_donations
      get :processed_donations
    end
  end

  resources :donations do
    member do
      get :schedule
      put :accept
      put :confirm
      put :received
      put :reject
    end
  end
end
