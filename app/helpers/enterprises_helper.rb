module EnterprisesHelper

  def media_list_img_layout index
    index.even? ? "pull-right" : "pull-left"
  end
end
