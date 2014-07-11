class PostBuilder
  
  def generate source, rss, logo, current_user
    Post.create!({
                   :title   => force_encoding(source.title),
                   :content => force_encoding(source.description),
                   :description => force_encoding(source.description),
                   :from    => rss.sitename,
                   :logo   => logo,
                   :url     => force_encoding(source.link),
                   :user_id    => current_user.id,
                   :domain_id => rss.domain.id
                 })
  end

  private
  def force_encoding str
    str.force_encoding("UTF-8")
  end
end
