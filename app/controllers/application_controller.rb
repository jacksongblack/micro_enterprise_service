# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  # 异常种类：
  # rescue_from ActionController::UnknownController 
  # rescue_from AbstractController::ActionNotFound
  # rescue_from NoMethodError
  # rescue_from RuntimeError
  # rescue_from Mongoid::Errors::DocumentNotFound
  # rescue_from Mongoid::Errors::Validations
  # rescue_from Moped::Errors::OperationFailure
  # rescue_from NameError
  # rescue_from CanCan::AccessDenied

  protect_from_forgery with: :exception

  #rescue_from Exception do |exception|
	#  flash[alert]= exception.message
	#  render "/layouts/error", :layout => false
  #end
  
  def routing_error
   # flash[:alert] = t('controller.application.routes_error')
    render "/layouts/error" ,:layout => false
  end
  
  def after_sign_in_path_for resource
    if current_user.enterprise.blank?
      flash[:notice] = t('controller.application.sigin_with_no_enterprise')
      enterprise_users_path
    else
      root_path
    end
  end
end
