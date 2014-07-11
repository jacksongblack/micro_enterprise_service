class PostsCell < Cell::Rails
  helper PostsHelper
  helper ApplicationHelper

  def infor args
    @post = args[:post]
    template = args[:format].blank? ? "simple_infor" : "full_infor"
    render view: template
  end

  def operate args
    @current_user = args[:current_user]
    @post = args[:post]
    render if @current_user&&@current_user.can_write?(@post)
  end

  def tags args
    @tags = args[:tags]
    template = @tags.blank? ? "no_tag" : "tags"
    render view: template
  end

  def pre args
    begin
      @pre = Post.find(args[:post_id]-1)
      render
    rescue
      render view: "no_post"
    end
  end

  def next args
    begin
      @next = Post.find(args[:post_id]+1)
      render
    rescue
      render view: "no_post"
    end
  end
end
