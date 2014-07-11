# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_action :authenticate_user!

  def enterprise
    @enterprise = current_user.enterprise
    return redirect_to new_enterprise_path if @enterprise.blank?
    redirect_to enterprise_path @enterprise
  end

  def call_rss_service
    RssService.new(current_user).work
  end
end
