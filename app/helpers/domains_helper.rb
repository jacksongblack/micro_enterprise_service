module DomainsHelper

  def domains
    @domains ||= Domain.all
  end
  
  def lastest_domains_posts_hot index
    (1..4).to_a.include?(index) ? "hot_post" : ""
  end
end
