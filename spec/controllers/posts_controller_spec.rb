#encoding:utf-8
require 'spec_helper'

describe PostsController do
  let(:user) { create :current_user }
  
  before  do
    sign_in user
    @post = create :about_how_to_user_the_tax_of_micro_enterprise
  end

  describe "#show" do
    it "#display the details of one post " do
      get :show, id: @post.id
      assigns(:post).should eq(@post)
      expect(response).to be_success
      expect(response).to render_template("show")
    end
  end
  
  describe "#edit" do
    it "#show render new template " do
      get :edit, id: @post.id
      assigns(:post).should eq(@post)
      expect(response).to be_success
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    let(:post_attr) { attributes_for(:about_how_to_user_the_tax_of_micro_enterprise) }
    
    it "#params shoul include some necessity field" do
      post :create, post: post_attr
      expect(response).to redirect_to(post_path(assigns(:post)))
    end
  end
end










