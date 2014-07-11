require 'spec_helper'

describe "routing to dashboard" do
  
  context "legal routes:" do
    it "GET '/dashboard/index' => dashboard#index" do
      expect(:get => "/").to route_to(
        :controller => "dashboard",
        :action => "index")
    end
  end

  context "illlegal routes :" do
    it "GET '/dashboard/2/edit' => dashboard#edit" do
      expect(:get => "/dashboard/2/edit").not_to be_routable
    end

    it "GET 'dashboard/2' => dashboard#show" do
      expect(:get => "/dashboard/2").not_to be_routable
    end

    it "PUT '/dashboard/2' => dashboard#update" do
      expect(:put => "/dashboard/2").not_to be_routable
    end

    it "DELETE '/dashboard/2' => dashboard#delete" do
      expect(:delete => "/dashboard/2").not_to be_routable
    end

    it "POST '/dashboard' => dashbord#create" do
      expect(:post => "/dashboard").not_to be_routable
    end  

    it "GET => '/dashboard/new' => dashboard#new" do
      expect(:get => "/dashbord/new").not_to be_routable
    end
  end
end
