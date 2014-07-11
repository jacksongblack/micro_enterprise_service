#encoding:utf-8
require 'spec_helper'

describe RssService do
  let(:rss) { create :oschina_domain_rss }
  let(:ill_rss) { build_stubbed :ill_oschina_domain_rss }

  before :all do
    current_user = build_stubbed :current_user
    @rss_service = RssService.new current_user,Rss.all
  end

  describe "constant" do
    it "has a regular constant named REGULAE_LOGO" do
      expect(RssService::REGULAE_LOGO).to eq /\<url\>(.*)\<\/url\>/
    end
  end
    
  describe "#initialize" do

    it "init with current_user" do
      expect{RssService.new}.to raise_error(ArgumentError)
    end

    it "has a varible @rsses and return all Rss" do
      expect(@rss_service.instance_variable_get(:@rsses)).to eq Rss.all
    end
  end

  describe "#parse_for(rss)" do

    it "should raise an error if rss.url is blank" do
      expect{ @rss_service.parse_for(ill_rss) }.to raise_error do |e| 
        e.message.should == I18n.t('model.rss.url.blank')
      end
    end

#    it "should return a HASH if rss.url is legal" do
#      expect(@rss_service.parse_for rss).to be_an_instance_of(SimpleRSS) 
#    end
  end
  
  describe "#check_for" do
    let(:origin_feeds) { @rss_service.parse_for ill_rss }
    let(:image) { "logoadfasdf<url>http</url>" }

    context "origin_feeds.image that get from rss  parsed whether include a logo url path" do

      it "shuild raise an error if origin_feeds.image is blank" do
        expect{ @rss_service.check_for origin_feeds.image }.to raise_error do |e|
          e.message.should == I18n.t('model.rss.image.blank')
        end
      end

      it "shuild return an url that begin with http when origin_feeds.image is legal" do
        expect(@rss_service.check_for(image)).to match(/^http/)
      end
    end
  end

  describe "#filter_for" do

    context "filter out the feed form feeds when meet the follow case" do
      it "the description field is blank" do
       # pending "the description field is blank"
      end

      it "the title field is blank" do
       # pending "the title field is blank"
      end

      it "the link field is blank" do
       # pending "the link field is blank"
      end
    end
  end

  describe "#create_local_logo_path" do
    context "give a remote image url and a rss" do
      it "return a local image url path" do
    #    expect(@rss_service.send :create_local_logo_path, rss).to eql("/rss_assets/kaiyuanzhongguo.png")
      end
    end
  end
=begin
  describe "#create_local_logo" do
    let(:local_logo_path){"/rss_assets/kaiyngguo.png"}
    let(:remote_logo_path){"http://www.baidu.com/img/bdlogo.gif"}

    context "give a remote image url and a local image url" do
      it "should write remote image to local image" do
        @rss_service.send :create_local_logo, remote_logo_path, local_logo_path
        expect(File.exists?(Rails.root.to_s+"/public"+local_logo_path)).to be_true
        File.delete(Rails.root.to_s+"/public"+local_logo_path)
      end
      
      it "if the remote url are not a image url shoulde raise error" do
        expect{@rss_service.send :create_local_logo, rss.url, local_logo_path}.to raise_error("MiniMagick::Invalid")
      end
    end
  end
=end
end

