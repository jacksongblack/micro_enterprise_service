# -*- coding: utf-8 -*-
module PostsHelper

  def post_link post
    return link_to "http://localhost:3000/posts/#{post.id}", post unless post.url
    content_tag(:a, "#{post.url}", href: post.url, target: "_blank")
  end
end
