require 'spec_helper'

describe Post do
=begin
  describe  "Test Association table" do
    context "post associatin domain" do
      before do
        @domain = create(:farm_domain, id: "100")
        @domain_post= create(:about_how_to_user_the_tax_of_micro_enterprise, domain: @domain)
      end

      it "test posts Association domain" do
#        @domain_post.domain.should eq(@domain)
#        @domain.posts.first.should eq @domain_post
      end
    end


    context "post associatin industry" do
      before do
        @industry = create(:farm_industry, id: "100")
        @industry_post= create(:about_how_to_user_the_tax_of_micro_enterprise, industry: @industry)
      end

      it "test posts Association industry" do
        @industry_post.industry.should eq(@industry)
        @industry.posts.first.should eq @industry_post
      end
    end
  end
=end
end
