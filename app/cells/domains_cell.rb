class DomainsCell < Cell::Rails
  helper DomainsHelper

  def index_nav args
    @domain = args[:domain]
    return render view: :index_nav unless @domain.blank?
    render view: :default_index_nav
  end
end
