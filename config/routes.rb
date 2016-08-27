Rails.application.routes.draw do
  devise_for :users

  root to: "pages#landing_page"
end
