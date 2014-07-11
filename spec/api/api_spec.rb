#encoding:utf-8
require 'spec_helper'

# -*- coding: utf-8 -*-
describe MicroEnterpriseService::API do


describe "authenticated" do

    it "没有登录的状态，应返回没有登录" do
      get "api/test" do

      end
    end

    it "创建session" do
      post "" do
      end
    end

end




=begin
  before :all do
    @post = create :about_how_to_user_the_tax_of_micro_enterprise 
    @industry = create :farm_industry
    @domain = create :farm_domain
  end

  describe "resource posts" do
    context "GET /api/posts/:id" do
      it "return a post details according to the id that the url has given" do
        get "/api/posts/#{@post.id}"
        response.body.to_json == @post.to_json
      end
    end
  end

  describe "resource domains" do
    context "GET /api/domains/" do
      it "returns an  array of all domains" do
        get "/api/domains"
        response.status.should == 200
        response.body.to_json == Domain.all.to_json
      end
    end

    context "GET /api/domains/posts" do
      it "returns an  array of hoting posts from domains" do
        get "/api/domains/posts"
        response.status.should == 200
        response.body.to_json == Post.from_domain.to_json
      end
    end

    context "GET /api/domains/:id/posts" do
      it "returns  posts belongs to one domain according to the id form url" do
        get "/api/domains/1/posts"
        response.status.should == 200
        response.body.to_json == Domain.find(1).posts.to_json
      end
    end    
  end

  describe "resource industries" do
    context "GET /api/industries/" do
      it "returns an  array of all industries" do
        get "/api/industries"
        response.status.should == 200
        response.body.to_json == Industry.all.to_json
      end
    end

    context "GET /api/industries/posts" do
      it "returns an  array of hoting posts from industries" do
        get "/api/industries/posts"
        response.status.should == 200
        response.body.to_json == Post.from_industry.to_json
      end
    end

    context "GET /api/industries/:id/posts" do
      it "returns  posts belongs to one industry according to the id form url" do
        get "/api/industries/1/posts"
        response.status.should == 200
        response.body.to_json == Industry.find(1).posts.to_json
      end
    end    

    context "GET /api/industries/:id/enterprises" do
      it "returns  enterprises belongs to one industry according to the id form url" do
        get "/api/industries/1/enterprises"
        response.status.should == 200
        response.body.to_json == Industry.find(1).enterprises.to_json
      end
    end  

    context "GET /api/industries/:id/products" do
      it "returns  products belongs to one industry according to the id form url" do
        get "/api/industries/1/products"
        response.status.should == 200
        response.body.to_json == Industry.find(1).products.to_json
      end
    end  
  end
=end  

end
