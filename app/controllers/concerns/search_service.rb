class SearchService

  def work params
    self.send params[:source].to_sym, params
  end

  def domains params
    Post.from_domain.search_for params[:search]
  end

  def industries params
    Post.from_industry.search_for params[:search]
  end

  def products params
    Product.search_for params[:search]
  end

  def enterprises params
    Enterprise.search_for params[:search]
  end

  def technologies params
    Technology.search_for params[:search]
  end
end
