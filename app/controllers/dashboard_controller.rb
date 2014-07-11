class DashboardController < ApplicationController

  def index
    @posts = Post.all.limit 2
  end
end

