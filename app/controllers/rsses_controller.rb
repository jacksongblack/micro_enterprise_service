class RssesController < ApplicationController
  include ResponseHandleService
  before_action :authenticate_user!, :only => [:create, :edit, :update, :destroy]
  before_action :set_rss, :only => [:edit, :update, :destroy]

  def domains
    @rsses = Rss.domains
    @rsses = @rsses.paginate(:page => params[:page])
  end

  def industries
    @rsses = Rss.industries
    @rsses = @rsses.paginate(:page => params[:page])
  end

  def grab_from
    @rsses = Rss.send(params[:region].to_sym)
    @rsses = @rsses.where(id: params[:id]) unless params[:id].blank?
    counts = RssService.new(current_user,@rsses).work
    render :json => JSON.parse('{"notice":"'+t('controller.rss.grab_from.success')+counts.to_s+'"}')
  end

  def update
    @rss.update(rss_params)
    handle_response_for @rss
  end

  def show
    redirect_to :back
  end

  def create
    @rss = Rss.new rss_params
    handle_response_for @rss
  end
  
  def destroy
    @rss.destroy
    flash[:notice] = t('controller.rss.destroy.success')
    redirect_to :back
  end

  private
  def set_rss
    @rss = Rss.find(params[:id])
  end

  def rss_params
    @params_permit ||= ParamsPermitService.new
    @params_permit.send :rss, params
  end
end
