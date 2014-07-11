# -*- coding: utf-8 -*-
RailsAdmin.config do |config|
  config.included_models = ['Picture','AttachmentFile','Post','Rss','Domain','Industry']
  config.current_user_method { current_user }

  config.model 'Rss' do
    label "RSS管理" 
    label_plural "RSS管理"
  end

  config.model 'Industry' do
    label "行业信息管理" 
    label_plural "行业信息管理"
  end

  config.model 'Post' do
    label "文章管理" 
    label_plural "文章管理"
  end

  config.model 'Domain' do
    label "新闻导航管理" 
    label_plural "新闻导航管理"
  end
end
