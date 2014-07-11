require 'spec_helper'

describe "routing to posts" do
  
  context "legal routes:" do
    it "POST '/posts' => posts#create" do
      expect(:post => "/posts").to route_to(
        :controller => "posts",
        :action => "create")
    end

    it "GET '/posts/new/ => posts#new" do
      expect(:get => "/posts/new").to route_to(
        :controller => "posts",
        :action => "new")
    end

    it "GET '/posts/2/edit' => posts#edit" do
      expect(:get => "/posts/2/edit").to route_to(
        :action => "edit",
        :controller => "posts",
        :id => "2")
    end

    it "GET '/posts/2' => posts#show" do
      expect(:get => "/posts/2").to route_to(
        :controller => "posts",
        :action => "show",
        :id => "2")
    end

    it "DELETE '/posts/2' => posts#destroy" do
      expect(:delete => "/posts/2").to route_to(
        :controller => "posts",
        :action => "destroy",
        :id => "2")
    end  

    it "PUT '/posts/2' => posts#update" do
      expect(:put => "/posts/2").to route_to(
        :controller => "posts",
        :action => "update",
        :id => "2")
    end  
  end
  
  context "illlegal routes :" do
    it "GET '/posts' =>  posts#index  " do
      expect(:get => "/posts").not_to be_routable
    end
  end
end
