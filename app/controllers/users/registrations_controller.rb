class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :update]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end


  def create
    # byebug
    build_resource(sign_up_params)
    resource.save
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        sign_in(resource_name, resource)
        render json: { after_sign_in_path: after_sign_in_path_for(User) }
      else
        expire_data_after_sign_in!
        render json: { error: 'Something went wrong' }, status: 422
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: { error: resource.errors.full_messages.join('<br>') }, status: 422
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    # byebug
    resource_updated = update_resource(resource, sign_up_params)
    if resource_updated
      bypass_sign_in resource, scope: resource_name
      render json: { after_sign_in_path: after_sign_in_path_for(User) }
    else
      clean_up_passwords resource
      render json: { error: resource.errors.full_messages.join('<br>') }, status: 422
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_sign_up_params
    # byebug
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:detail_type, detail_attributes: [:id, :description, :category, :name, :age, :gender, :occupation]])
  end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
