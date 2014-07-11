# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :current_user, :class => User do
    email "lbyronlee@gmail.com"
    password "lijianghua"
  end
end
