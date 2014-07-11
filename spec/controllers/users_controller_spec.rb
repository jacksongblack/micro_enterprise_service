#encoding:utf-8
require 'spec_helper'

describe UsersController do

  before :all do
    @users_controller = UsersController.new
  end

  describe "handle grabe rss" do


    describe "GET #call_rss_service" do

      before :all do
        @oschina_rss =  create :oschina_domain_rss
      end

      it "#call_rss_service" do
#        @users_controller.call_rss_service
      end

    end
  end
end
