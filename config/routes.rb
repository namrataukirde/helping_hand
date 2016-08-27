Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}

  resources :users do
    collection do
      get :profiles
    end
  end

  root to: "pages#landing_page"
end
