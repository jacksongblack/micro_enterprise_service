# -*- coding: utf-8 -*-
module RecommendHelper
  
  # 新闻资讯
  def focus_domain_posts num
    Post.has_image.limit num
  end

  # 新闻导航今日热点
  def today_hotting_posts
    Post.all.limit 54
  end

  # 猜你喜欢在行业信息
  def guess_you_like_industry_posts
    Post.from_industry.order('id DESC').limit(17).sort_by{|item| item.views.count}.reverse
  end

  # 猜你喜欢在新闻
  def guess_you_like_domain_posts
    Post.from_domain.order('id DESC').limit(17).sort_by{|item| item.views.count}.reverse
  end

  # 热门新闻
  def recommand_domain_posts
    Post.from_domain.limit(17).sort_by{|item| item.views.count}.reverse
  end

  # 热门行业信息
  def recommand_industry_posts
    Post.from_industry.limit(17).sort_by{|item| item.views.count}.reverse
  end

  # 最新新闻
  def lastest_domain_posts
    Post.from_domain.order('id DESC').limit(17)
  end

  # 最新行业信息
  def lastest_industry_posts
    Post.from_industry.order('id DESC').limit(17)
  end

  # 行业资讯
  def focus_industry_posts num
    Post.has_image.limit(num).order('id DESC')
  end
    
  # 行业热点
  def industry_hotting_post num
    Post.has_image.limit(num).sort_by{|item| item.views.count}.reverse
  end

  # 最新行业信息
  def lastest_industry_post num
    Post.has_image.order('id DESC').limit num
  end

  # 新闻导航正在发生
  def now
    Post.order('id DESC').limit 10
  end
  
  # 行业信息推荐
  def industries_recommend_posts num
    Post.from_industry.limit(num).sort_by{|item| item.views.count}.reverse
  end

  # 热卖产品
  def best_seller_products
    Product.all
  end

  # 猜你喜欢产品
  def recommend_you_like num
    Product.all.limit num
  end

  # 个性推荐
  def recommend_products num
	  Product.all.order('id DESC').limit num
  end

  # 最新产品
  def latest_products
    Product.all.order('id DESC')
  end

  # 最新入住企业
  def lastest_enterprises
    Enterprise.all.order('id DESC')
  end

  # 热门企业
  def hotting_enterprises
    Enterprise.all
  end

  # 最新注册科服机构
  def lastest_technologies
    Technology.all.order('id DESC')
  end
end
