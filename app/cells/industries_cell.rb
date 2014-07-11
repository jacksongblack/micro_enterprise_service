class IndustriesCell < Cell::Rails
  helper IndustriesHelper
  
  def index_nav args
    @industry = args[:industry]
    return render view: :index_nav unless @industry.blank?
    render view: :default_index_nav
  end
end
