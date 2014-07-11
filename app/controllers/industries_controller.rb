# -*- coding: utf-8 -*-
class IndustriesController < ApplicationController
  include ResponseHandleService
  before_action :authenticate_user!, :only => [:create, :edit, :update, :destroy]
  before_action :set_industry, :only => [:edit, :update, :destroy, :enterprises, :products]
  
  def index
    @industries = Industry.all
    @industries = @industries.paginate(:page => params[:page]).order("created_at DESC")
  end

  def posts
    set_industry unless params[:id].blank?
    @posts = @industry ? @industry.posts : Post.from_industry 
    @posts = @posts.paginate(:page => params[:page])
  end

  def enterprises
    @enterprises = @industry.enterprises
  end

  def products
    @products = @industry.products
  end

  def update
    @industry.update(industry_params)
    handle_response_for @industry
  end

  def show
    redirect_to :back
  end

  def create
    @industry = Industry.new industry_params
    handle_response_for @industry
  end
  
  def destroy
	  @industry.posts.destroy_all
	  @industry.enterprises.destroy_all
	  @industry.products.destroy_all
    @industry.destroy
	  flash[:notice] = t('controller.industry.destroy.success')
	  render :json => t('controller.industry.destroy.success')
  end

  private
  def industry_params
    @params_permit ||= ParamsPermitService.new
    @params_permit.send :industry, params
  end

  def set_industry
   @industry =  Industry.find(params[:id])
  end
end
