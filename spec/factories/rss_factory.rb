# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :oschina_industry_rss, :class => Rss do
    sitename  "开源中国"
    url       "http://www.oschina.net/code/rss"
    association :industry, factory: :farm_industry
  end

  factory :ill_oschina_industry_rss, :class => Rss do
    sitename  "开源中国"
    url       ""
    association :industry, factory: :farm_industry
  end

  factory :oschina_domain_rss, :class => Rss do
    sitename  "开源中国"
    url       "http://www.oschina.net/code/rss"
    association :domain, factory: :farm_domain
  end

  factory :ill_oschina_domain_rss, :class => Rss do
    sitename  "开源中国"
    url       ""
    association :domain, factory: :farm_domain
  end
end
