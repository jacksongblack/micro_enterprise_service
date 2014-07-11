# -*- coding: utf-8 -*-
class DomainsController < ApplicationController
  include ResponseHandleService
  before_action :authenticate_user!, :only => [:create, :edit, :update, :destroy]
  before_action :set_domain, :only => [:edit, :update, :destroy]
  
  def index
    @domains = Domain.all
    @domains = @domains.paginate(:page => params[:page]).order("created_at DESC")
  end

  def posts
    set_domain unless params[:id].blank?
    @posts = @domain ? @domain.posts : Post.from_domain
    @posts = @posts.paginate(:page => params[:page])
  end

  def update
    @domain.update(domain_params)
    handle_response_for @domain
  end

  def show
    redirect_to :back
  end

  def create
    @domain = Domain.new domain_params
    handle_response_for @domain
  end
  
  def destroy
	  @domain.posts.destroy_all
	  @domain.destroy
	  flash[:notice] = "删除成功！"
	  render :json =>  "删除成功！"
  end

  private
  def domain_params
    @params_permit ||= ParamsPermitService.new
    @params_permit.send :domain, params
  end

  def set_domain
   @domain =  Domain.find(params[:id])
  end
end
