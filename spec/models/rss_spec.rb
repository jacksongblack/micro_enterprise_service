# -*- coding: utf-8 -*-
require 'spec_helper'

describe Rss do
  describe "valid  field" do
    let(:post_attr_with_sitename_blank) { {url: "http:baidu.com"} }
    let(:post_attr_with_url_blank) { {sitename: "开源中国"} }

    it "sitename field must be present" do
      expect{ Rss.create!(post_attr_with_sitename_blank) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "url field must be present" do
      expect{ Rss.create!(post_attr_with_url_blank) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
