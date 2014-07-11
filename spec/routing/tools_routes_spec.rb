require 'spec_helper'

describe "routing to tools " do
  
  context "legal routes:" do
    it "GET '/tools/express' => tools#express" do
      expect(:get => "/tools/express").to route_to(
        :controller => "tools",
        :action => "express")
    end

    it "GET '/tools/patent' => tools#patent" do
      expect(:get => "/tools/patent").to route_to(
        :controller => "tools",
        :action => "patent")
    end
  end

  context "illlegal routes :" do

    it "GET '/tools' => tools#index" do
      expect(:get => "/tools").not_to be_routable
    end

    it "GET '/tools/2' => tools#show" do
      expect(:get => "/tools/2").not_to be_routable
    end

    it "POST '/tools' => tools#create" do
      expect(:post => "/tools").not_to be_routable
    end

    it "GET '/tools/new' => tools#new" do
      expect(:get => "/tools/new").not_to be_routable
    end

    it "GET '/tools/2/edit' => tools#edit" do
      expect(:get => "/tools/2/edit").not_to be_routable
    end

    it "DELETE '/tools/2' => tools#destroy" do
      expect(:delete => "/tools/2").not_to be_routable
    end  

    it "PUT '/tools/2' => tools#update" do
      expect(:put => "/tools/2").not_to be_routable
    end
  end
end
