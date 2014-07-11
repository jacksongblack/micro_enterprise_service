# -*- coding: utf-8 -*-
class ProductsController < ApplicationController
  include ResponseHandleService
  before_action :set_product, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  before_action :record_view, :only =>[:show]
  before_action :set_search_service, :only => [:search]

  def index
    @products = Product.all
  end 

  def search
    @products = @search_service.work params
  end

  def new
    if current_user.enterprise.blank?
      return redirect_to enterprise_users_path
    end
    @product = Product.new
  end

  def show
    @products = Product.all
  end
  
  def edit
    render "new"
  end

  def create 
    @product = Product.new(product_params)
    handle_response_for @product
  end

  def update
    @product.update(product_params)
    handle_response_for @product
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private 
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    @params_permit ||= ParamsPermitService.new
    @params_permit.send :product, params,current_user
  end

  def record_view
    @view_cunt_service ||= ViewCountService.new
    @view_cunt_service.send :record_view,current_user,{product_id: @product.id}
  end

  def set_search_service
    @search_service ||= SearchService.new
  end
end
