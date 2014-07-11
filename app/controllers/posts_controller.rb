# -*- coding: utf-8 -*-
class PostsController < ApplicationController
  include ResponseHandleService
  before_action :set_post, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
  before_action :record_view, :only =>[:show]
  before_action :set_search_service, :only => [:search]
  before_action :disable_xss_protection

  def show
  end

  def search 
    @posts = @search_service.work params
    @posts = @posts.paginate(:page => params[:page])
  end

  def new
    if current_user.enterprise.blank?
      return redirect_to enterprise_users_path
    end
    @post = Post.new
  end
  
  def edit
    render "new"
  end

  def create
    @post = Post.new(post_params)
    @post.tag_list = tags_params
    handle_response_for @post
  end

  def update
    @post.tag_list = tags_params
    @post.update(post_params)
    handle_response_for @post
  end

  def destroy
    @post.destroy
    flash[:notice] = "新闻删除成功！"
    redirect_to :root
  end

  private
  def set_post
    @post =  Post.find(params[:id])
  end

  def tags_params
    params[:post][:tag_list]
  end

  def post_params
     @params_permit ||= ParamsPermitService.new
     @params_permit.send :post, params,current_user
  end

  def record_view
    @view_cunt_service ||= ViewCountService.new
    @view_cunt_service.send :record_view,current_user,{post_id: @post.id}
  end

  def set_search_service
    @search_service ||= SearchService.new
  end

	def disable_xss_protection
		response.headers['X-XSS-Protection'] = '0'
	end
end
