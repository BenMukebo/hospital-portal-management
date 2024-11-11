# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username terms_of_service])
  end

  # def after_sign_out_path_for scope
  #   root_path
  # end

  # def after_sign_in_path_for(resource)
  #   if resource.receptionist?
  #     patients_path
  #   elsif resource.doctor?
  #     # user_path(resource)
  #     doctor_dashboard_path
  #   else
  #     root_path
  #   end
  # end
end
