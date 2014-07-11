# -*- coding: utf-8 -*-
module MicroEnterpriseService
  class API < Grape::API
    require 'helpers'
    format :json
    prefix "api"
    helpers HuthenticatedHelpers

    resource :search do
      get do
        @result = SearchService.new.work(params).paginate(:page => params[:page_number], :per_page => 10)
        @result.map do |search|
          search.attributes.merge({image_url: search.avatar.url}) rescue next
        end
        @result
      end
    end

    resource :login do
      get do
        "success"
      end
    end

    params do
      requires :email, :type => String
      requires :password, :type => String
    end
    post :session_create do
      if  cookies[:email].eql?(params[:email])
        return {status: "ok", message: "你已经登录，无需再次登录"}
      end
      user = User.find_by({email: params[:email]})
      return  {status: "fails", message: "用户名错误！"} unless user
      return  {status: "fails", message: "密码错误！"} unless user.valid_password?(params[:password])
      cookies[:email] = params[:email]
      {status: "ok", message: "登录成功！"}
    end

    desc "消除session,退出登录"
    get :destroy_session do
      authenticated?
      cookies[:email] = nil
      {status: "ok", message: "退出成功！"}
    end

    desc "更新密码"
    post :update_password do
      authenticated?
      user= current_user
      return  {status: "fails", message: "原密码错误！"} unless user.valid_password?(params[:old_password]);
      user.password=params[:new_password]
      return {status: "ok", message: "密码更新成功"} if user.save
    end

    desc "返回用户"
    get :user do
      authenticated?
      enterprise = User.find_by({email: cookies[:email]}).enterprise
      enterprise.attributes.merge({image_url:enterprise.avatar.url})
    end

    desc "test"
    get :test do
      authenticated?
      "Already logged"
    end

    # -------- posts source API
    #  GET     posts/:id          => 返回具体某条
    #  POST    posts/search          => 搜索
    resource :posts do
      desc "return a post"
      params do
        requires :post_id, :type => String, :desc => "post id"
      end
      route_param :post_id do
        desc "返回具体某条新闻"
        get do
          Post.find(params[:post_id])
        end
      end

      params do
        requires :source, :type => String, :desc => "controller name"
        requires :search, :type => String, :desc => "key word"
      end
      desc "返回搜索新闻结果"
      post :search do
        SearchService.new.work(params).paginate(:page => params[:page_number], :per_page => 10).map do|post|
          post.attributes.merge({image_url:post.avatar.url})
        end
      end
    end

    # -------- domains source API
    #  GET     domains                    => 返回所有的新闻类别
    #  GET     domains/posts              => 返回新闻导航里面的热门新闻
    #  GET     domains/:id/posts          => 返回某一新闻类别下面的所有新闻
    resource :domains do
      desc "返回所有的新闻类别"
      get do
        Domain.all
      end

      desc "返回新闻导航里面的热门新闻"
      get '/posts' do
        Post.from_domain.order("created_at desc").paginate :page => params[:page_number], :per_page => 10
      end

      params do
        requires :domain_id, :type => String, :desc => "domain id"
      end
      route_param :domain_id do
        desc "返回某一类别下的所有新闻"
        get '/posts' do
          Domain.find(params[:domain_id]).posts.order("created_at DESC").paginate :page => params[:page_number], :per_page => 10
        end
      end
    end

    # -------- industries source API
    #  GET     industries                    => 返回所有的行业
    #  GET     industries/posts              => 返回行业信息里面的热门信息
    #  GET     industries/:id/posts          => 返回某一行业下面的所有信息
    #  GET     industries/:id/enterprises    => 返回某一行业下的所有企业
    #  GET     industries/:id/products       => 返回某一行业下面的所有产品
    resource :industries do
      desc "返回所有的行业"
      get do
        Industry.all
      end
      desc "返回行业信息里面的热门信息"
      get '/posts' do
        Post.from_industry
      end

      params do
        requires :industry_id, :type => String, :desc => "industry id"
      end
      route_param :industry_id do
        desc "返回某一行业下的所有信息"
        get '/posts' do
          Industry.find(params[:industry_id]).posts.order("created_at DESC").paginate :page => params[:page_number], :per_page => 10
        end

        desc "返回某一行业下的所有企业"
        get '/enterprises' do
          Industry.find(params[:industry_id]).enterprises.order("created_at DESC").paginate(:page => params[:page_number], :per_page => 10).map do |endpoint|
            endpoint.attributes.merge({image_url: endpoint.avatar.url})
          end
        end

        desc "返回某一行业下所有产品"
        get '/products' do
          Industry.find(params[:industry_id]).products.order("created_at DESC").paginate(:page => params[:page_number], :per_page => 10).map do |product|
            product.attributes.merge({image_url: product.avatar.url})
          end
        end
      end
    end

    # -------- products source API
    #  GET     products/:id                    => 返回具体某个产品
    #  GET     products/search             => 根据关键字返回搜索结果
    resource :products do   
      desc "返回热门产品"
      get do
        Product.all
      end

      params do
        requires :product_id, :type => String, :desc => "product id"
      end
      route_param :product_id do
        desc "返回某个产品的具体信息"
        get do
          product = Product.find(params[:product_id])
          product.attributes.merge({image_url: product.avatar.url})
        end
      end

      params do
        requires :source, :type => String, :desc => "controller name"
        requires :search, :type => String, :desc => "key word"
      end
      desc "返回搜索产品结果"
      post :search do
        SearchService.new.work(params).paginate(:page => params[:page_number], :per_page => 10).map do|product|
          product.attributes.merge({image_url:product.avatar.url})
        end
      end
    end

    # -------- enterprises source API
    #  GET     enterprises                    => 返回热门企业
    #  GET     enterprises/:id                => 返回某个企业的具体信息
    #  GET     enterprises/search             => 根据关键字返回搜索结果
    resource :enterprises do   
      desc "返回热门企业"
      get do
        Enterprise.all.map do |enterprise|
          enterprise.to_json.chop << ",\"avatar\":#{enterprise.avatar.url}}"
        end
      end

      params do
        requires :enterprise_id, :type => String, :desc => "enterprise id"
      end
      route_param :enterprise_id do
        desc "返回某个企业的具体信息"
        get do
          enterprise = Enterprise.find(params[:enterprise_id])
          enterprise.attributes.merge({image_url: enterprise.avatar.url})
        end
      end

      params do
        requires :source, :type => String, :desc => "controller name"
        requires :search, :type => String, :desc => "key word"
      end
      desc "返回搜索企业结果"
      post :search do
        SearchService.new.work(params).paginate(:page => params[:page_number], :per_page => 10).map do|enterprise|
          enterprise.attributes.merge({image_url:enterprise.avatar.url})
        end
      end
    end


    # -------- technologies source API
    #  GET     technologies                    => 返回热门科技服务机构
    #  GET     technologies/:id                => 返回某个科技服务机构的具体信息
    #  GET     technologies/search             => 根据关键字返回搜索结果
    resource :technologies do   
      desc "科技服务机构"
      get do
        Technology.all.paginate(:page => params[:page_number], :per_page => 10).map do |technology|
          technology.attributes.merge({image_url:technology.avatar.url})
        end
      end

      params do
        requires :technology_id, :type => String, :desc => "technology id"
      end
      route_param :technology_id do
        desc "返回某个科技服务机构的具体信息"
        get do
          Technology.find(params[:technology_id])
        end
      end

      params do
        requires :source, :type => String, :desc => "controller name"
        requires :search, :type => String, :desc => "key word"
      end
      desc "返回搜索科技服务机构结果"
      post :search do
        SearchService.new.work(params).paginate(:page => params[:page_number], :per_page => 10).map do|searchService|
          searchService.attributes.merge({image_url:searchService.avatar.url})
        end
      end
    end


    # -------- API的异常捕获处理
    rescue_from Grape::Exceptions::ValidationErrors do |e|
      Rack::Response.new({
                             'status' => e.status,
                             'message' => e.message,
                           'errors' => e.errors
                         }.to_json, e.status)
    end

    rescue_from :all do |e|
      Rack::Response.new([e.message], 500, {"Content-type" => "application/json"}).finish
    end

    rescue_from ArgumentError do |e|
      Rack::Response.new(["ArgumentError: #{e.message}"], 500)
    end

    rescue_from NotImplementedError do |e|
      Rack::Response.new(["NotImplementedError: #{e.message}"], 500)
    end
  end
end
