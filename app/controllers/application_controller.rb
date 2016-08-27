class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # def after_sign_out_path_for(resource_or_scope)
  #   user_profiles_path
  # end

  def after_sign_in_path_for(resource_or_scope)
    profiles_users_path
  end
end
