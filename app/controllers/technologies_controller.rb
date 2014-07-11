# -*- coding: utf-8 -*-
class TechnologiesController < ApplicationController
  include ResponseHandleService
  before_action :set_technology, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  before_action :record_view, :only =>[:show]
  before_action :set_search_service, :only => [:search]

  def index
    @technologies = Technology.all
    @technologies = @technologies.paginate(:page => params[:page])
  end  

  def search
    @technologies = @search_service.work params
    @technologies = @technologies.paginate(:page => params[:page])
  end

  def new
    @technology = Technology.new
  end

  def show
  end
  
  def edit
    render "new"
  end

  def create 
    @technology = Technology.new(technology_params)
    handle_response_for @technology 
  end

  def update
    @technology.update(technology_params)
    handle_response_for @technology
  end

  def destroy
    @technology.destroy
    redirect_to technologies_url
  end

  private 
  def set_technology
    @technology = Technology.find(params[:id])
  end

  def technology_params
    @params_permit ||= ParamsPermitService.new
    @params_permit.send :technology, params
  end

  def record_view
    @view_cunt_service ||= ViewCountService.new
    @view_cunt_service.send :record_view,current_user,{technology_id: @technology.id}
  end

  def set_search_service
    @search_service ||= SearchService.new
  end
end
