Rails.application.routes.draw do
  devise_for :users

  root to: "pages#landing_page"
  get 'items/accept_item'
  resources :ngos
end
