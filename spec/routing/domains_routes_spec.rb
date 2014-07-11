require 'spec_helper'

describe "routing to domains" do
  
  context "legal routes:" do
    it "GET '/domains/(:id)/posts' => domains#posts" do
      expect(:get => "/domain/2/posts").to route_to(
        :controller => "domains",
        :action => "posts",
        :id => "2")
    end

    it "GET '/domains/posts' => domains#posts" do
      expect(:get => "/domain/posts").to route_to(
        :controller => "domains",
        :action => "posts")
    end

   it "GET '/industry/products' => industries#products" do
      expect(:get => "/industry/products").to route_to(
        :controller => "industries",
        :action => "products")
    end


    it "GET '/domains' => domains#index" do
      expect(:get => "/domains").to route_to(
        :controller => "domains",
        :action => "index")
    end

    it "GET '/domains/2' => domains#show" do
      expect(:get => "/domains/2").to route_to(
        :controller => "domains",
        :action => "show",
        :id => "2")
    end

    it "POST '/domains' => domains#create" do
      expect(:post => "/domains").to route_to(
        :controller => "domains",
        :action => "create")
    end

    it "DELETE '/domains/2' => domains#destroy" do
      expect(:delete => "/domains/2").to route_to(
        :controller => "domains",
        :action => "destroy",
        :id => "2")
    end
  end

  context "illlegal routes :" do
    
      it "GET '/domains/2/edit/ => domains#edit" do
        expect(:get => "/domains/2/edit").not_to be_routable
    end

  end
end
