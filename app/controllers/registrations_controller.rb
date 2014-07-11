# -*- coding: utf-8 -*-
class RegistrationsController < Devise::RegistrationsController

  protected
  def after_sign_up_path_for(resource)
    flash[:notice] = "赶快来填写你的企业的相关信息吧！以便完成注册！"
    enterprise_users_path
  end
end
