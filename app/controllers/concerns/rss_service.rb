# -*- coding: utf-8 -*-
require 'rss/2.0'
require 'open-uri'
require 'simple-rss'

class RssService

  REGULAE_LOGO = /\<url\>(.*)\<\/url\>/

  def initialize current_user,rsses
    @rsses = rsses
    @current_user = current_user
  end

  def work
    old_posts_count = Post.count
    @rsses.each do |rss|
      begin
        origin_feeds = parse_for rss
        remote_logo = check_for origin_feeds.image
        local_logo_path = create_local_logo_path rss
        local_logo = create_local_logo remote_logo, local_logo_path 
        available_feeds = filter_for origin_feeds
        create_post_by available_feeds, rss, local_logo_path 
      rescue
        next
      end
    end
    Post.count - old_posts_count
  end

  def parse_for rss
    raise t('model.rss.url.blank') if rss.url.blank?
    SimpleRSS.parse open(rss.url)
  end

  def check_for image
    result = REGULAE_LOGO.match(image).to_a[1]
    result.blank? ? (raise t('model.rss.image.blank')) : result
  end

  def filter_for feeds
    feeds.items.select do |feed|
      !feed.description.blank?  &&
        !feed.title.blank?        &&
        !feed.link.blank?         &&
        !Post.find_by_title(feed.title)
    end
  end

  def create_post_by feeds, rss, local_logo
    @post_builder ||= PostBuilder.new
    feeds.each do |feed|
      @post_builder.generate(feed, rss, local_logo, @current_user) rescue next
    end
  end

  private
  def create_local_logo remote_logo, local_logo_path 
    return if  File.exists?(Rails.root+"/public"+local_logo_path)
    @logo_handle ||= MiniMagick::Image
    @logo_handle.open(remote_logo).write("public/"+local_logo_path)
  end
  
  def create_local_logo_path rss
    file_name = PinYin.of_string(rss.sitename).join
    "/rss_assets/"+file_name+".png"
  end
end
