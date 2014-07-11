require 'spec_helper'

describe "routing to industroies" do
  
  context "legal routes:" do
    it "GET '/industry/(:id)/posts' => industries#posts" do
      expect(:get => "/industry/1/posts").to route_to(
        :controller => "industries",
        :action => "posts",
        :id => "1")
    end

    it "GET '/industry/posts' => industries#posts" do
      expect(:get => "/industry/posts").to route_to(
        :controller => "industries",
        :action => "posts")
    end

    it "GET '/industry/(:id)/enterprises' => industries#enterprises" do
      expect(:get => "/industry/1/enterprises").to route_to(
        :controller => "industries",
        :action => "enterprises",
        :id => "1")
    end

    it "GET '/industry/enterprises' => industries#enterprises" do
      expect(:get => "/industry/enterprises").to route_to(
        :controller => "industries",
        :action => "enterprises")
    end

    it "GET '/industry/(:id)/products' => industroies#products" do
      expect(:get => "/industry/1/products").to route_to(
        :controller => "industries",
        :action => "products",
        :id => "1")
    end

    it "GET '/industry/products' => industries#products" do
      expect(:get => "/industry/products").to route_to(
        :controller => "industries",
        :action => "products")
    end


    it "GET '/industries' => industries#index" do
      expect(:get => "/industries").to route_to(
        :controller => "industries",
        :action => "index")
    end

    it "GET '/industries/2' => industries#show" do
      expect(:get => "/industries/2").to route_to(
        :controller => "industries",
        :action => "show",
        :id => "2")
    end

    it "POST '/industries' => industries#create" do
      expect(:post => "/industries").to route_to(
        :controller => "industries",
        :action => "create")
    end


    it "DELETE '/industries/2' => industries#destroy" do
      expect(:delete => "/industries/2").to route_to(
        :controller => "industries",
        :action => "destroy",
        :id => "2")
    end

    it "PUT '/industries/2' => /industries#update" do
      expect(:put => "/industries/2").to route_to(
        :controller => "industries",
        :action => "update",
        :id => "2")
    end
  end

  context "illlegal routes :" do

    it "GET '/industries/2/edit' => industries#edit" do
      expect(:get => "/industries/2/edit").not_to be_routable
    end
  end
end
