# -*- coding: utf-8 -*-
module ApplicationHelper

  def detail_breadcrumbs object
    content_tag :p do
      begin_breadcrumbs+
      detail_breadcrumbs_for(object)+
      end_breadcrumbs("详情")
    end
  end
  
  def simple_breadcrumbs con_name, con_path, current
    content_tag :p do
      begin_breadcrumbs+
      content_tag(:a, con_name, href: con_path)+
      end_breadcrumbs(current)
    end
  end

  def format_for time
    time.strftime('%Y-%m-%d').to_s
  end
  
  def system_plates
    [["dashboard",root_path,"首&nbsp;&nbsp;&nbsp;&nbsp;页",],
     ["domains",posts_domain_path,"新闻导航","icon-globe"],
     ["industries",posts_industry_path,"行业信息","icon-bar-chart"],
     ["products",products_path,"产品市场","icon-trophy"],
     ["technologies",technologies_path,"科技服务超市","icon-plus-sign-alt"],
     ["tools",tools_express_path,"查询工具","icon-search"],
     ["enterprises",enterprises_path,"企业黄页","icon-hospital"]]
  end

  def sources_can_be_write
    return  basic_sources_can_be_write unless current_user.has_role?(:admin)
    basic_sources_can_be_write + 
      [["rsses","icon-pencil",domains_rsses_path,"RSS管理"],
       ["domains","icon-pencil",domains_path,"新建新导"],
       ["technologies","icon-pencil",new_technology_path,"科服机构"],
       ["industries","icon-pencil",industries_path,"新建行业"]]
  end

  def basic_sources_can_be_write
    [["registrations","icon-cog",edit_user_registration_path,"账户设置"],
     ["enterprises","icon-hospital",enterprise_users_path,"我的企业"],
     ["products","icon-pencil",new_product_path,"发布产品"],
     ["posts","icon-pencil",new_post_path,"发布新闻"]]     
  end
  
  private 
  def detail_breadcrumbs_for object
    case controller_name
      when "posts"
        (object.domain.blank? ? industry(object) : domain(object))
      when "products"
        product(object)
      end
  end

  def product product
	  return "行业不存在 " if product.industry.blank?
    (link_to "产品市场", products_path)+
    content_tag(:span, ">")+
    (link_to product.industry.name, products_industry_path(product.industry))
  end

  def industry post
		return "行业不存在 " if post.industry.blank?
    (link_to "行业信息", posts_industry_path)+
    content_tag(:span, ">")+
    (link_to post.industry.name, posts_industry_path(post.industry))
  end
  
  def domain post
	  return "类别不存在 " if post.domain.blank?
    (link_to "新闻导航", posts_domain_path)+
    content_tag(:span, ">")+
    (link_to post.domain.name, posts_domain_path(post.domain))
  end

  def begin_breadcrumbs
    content_tag(:i, " ",class: " icon-map-marker")+
    content_tag(:span, "你的位置:")+
    content_tag(:a,"首页", href: root_path)+
    content_tag(:span, ">")
  end

  def end_breadcrumbs current
    content_tag(:span, ">")+
    content_tag(:span, current)
  end
end
