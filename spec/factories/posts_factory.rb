# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :about_how_to_user_the_tax_of_micro_enterprise, :class => Post do
    title    "关于中小型企业的税务使用"
    description "这里是一些简要的描述摘要这里是一些简要的描述摘要这里是一些简要的描述摘要这里是一些简要的描述摘要这里是一些简要的描述摘要这里是一些简要的描述摘要这里是一些简要的描述摘要这里是一些简要的描述摘要这里是一些简要的描述摘要这里是一些简要的描述摘"
    content  "这是个重要的决定"
    from     "百合网"
    url      "http://baidu.com"
    logo     "http://baidu.com/logo.png"
    user_id  "2"
    domain_id "1"
  end
end
