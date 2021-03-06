class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters      
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :profile_pic, :remote_profile_pic_url])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :profile_pic, :remote_profile_pic_url])
    end

    def after_sign_in_path_for(resource)
      user_path(current_user)
    end

    def after_update_path_for(resource)
      get "users#show"
    end

    def after_sign_out_path_for(resource)
      root_path
    end
end
