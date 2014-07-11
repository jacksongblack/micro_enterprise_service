require 'spec_helper'

describe "routing to users" do

  context "legal routes:" do  

    it "POST  '/users/' => users#create" do
      expect(:post => "/users").to route_to(
        :controller => "registrations",
        :action => "create")
    end

    it "GET '/users/2/edit' => users#edit" do
      expect(:get => "/users/2/edit").to route_to(
        :action => "edit",
        :controller => "users",
        :id => "2")
    end

    it "GET '/users/2' =>  users#show" do
      expect(:get => "/users/2").to route_to(
        :controller => "users",
        :action => "show",
        :id => "2")
    end

    it "DELETE '/users/2' => users#destroy" do
      expect(:delete => "/users/2").to route_to(
        :controller => "users",
        :action => "destroy",
        :id => "2")
    end  

    it "PUT '/users/2' => users#update" do
      expect(:put => "/users/2").to route_to(
        :controller => "users",
        :action => "update",
        :id => "2")
    end 

    it "GET '/users/call_rss_service' =>  users#call_rss_service" do
      expect(:get => "/users/call_rss_service").to route_to(
        :controller => "users",
        :action => "call_rss_service")
    end  

    it "GET '/users/enterprise' => users#enterprise" do
      expect(:get => "/users/enterprise").to route_to(
        :controller => "users",
        :action => "enterprise")
    end  
   end

  context "illlegal routes :" do

    it "GET '/users' => users#index" do
      expect(:get => "/users").not_to be_routable
    end
  end

end
