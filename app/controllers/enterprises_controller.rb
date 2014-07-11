# -*- coding: utf-8 -*-
class EnterprisesController < ApplicationController
  include ResponseHandleService
  before_action :set_enterprise, :only => [:show, :edit, :update, :destroy,:products]
  before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  before_action :record_view, :only =>[:show]
  before_action :set_search_service, :only => [:search]

  def index
    @enterprises = Enterprise.all
    @enterprises = @enterprises.paginate(:page => params[:page])
  end  

  def search
    @enterprises = @search_service.work params
    @enterprises = @enterprises.paginate(:page => params[:page])
  end

  def products
    @products = @enterprise.products
  end

  def new
    unless current_user.enterprise.blank?
      return redirect_to enterprise_users_path
    end
    flash[:notice] = "你的企业信息还没有填写额，还是先来填写一下吧！"
    @enterprise = Enterprise.new
  end

  def show
    @enterprises =Enterprise.limit 5
  end
  
  def edit
    render "new"
  end

  def create 
    @enterprise = Enterprise.new(enterprise_params)
    handle_response_for @enterprise do |enterprise|
      current_user.create_enterprise(enterprise)
    end
  end

  def update
    @enterprise.update(enterprise_params)
    handle_response_for @enterprise
  end

  def destroy
		@enterprise.products.destroy_all
    @enterprise.destroy
		flash[:notice] = "企业删除成功！"
		render :json =>  "企业删除成功！"
  end

  private 
  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end

  def enterprise_params
    @params_permit ||= ParamsPermitService.new
    @params_permit.send :enterprise, params
  end

  def record_view
    @view_cunt_service ||= ViewCountService.new
    @view_cunt_service.send :record_view,current_user,{enterprise_id: @enterprise.id}
  end

  def set_search_service
    @search_service ||= SearchService.new
  end
end
