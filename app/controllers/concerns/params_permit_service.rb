class ParamsPermitService 

  def enterprise params
    params.require(:enterprise).permit(:name, 
                                 :address, 
                                 :phone,
                                 :url,
                                 :avatar,
                                 :email,
                                 :description, 
                                 :industry_id)
  end

  def technology params
    params.require(:technology).permit(:name, 
                                 :address, 
                                 :phone,
                                 :url,
                                 :avatar,
                                 :email,
                                 :introduction, 
                                 :services)
  end

  def post params,user
    params.require(:post).permit(:title, 
                                 :content, 
                                 :description,
                                 :domain_id,
                                 :industry_id,
                                 :from, 
                                 :logo)
      .merge!({:user_id => user.id})
  end
  
  def product params,user
    params.require(:product).permit(:name, 
                                 :price, 
                                 :description,
                                 :enterprise_id,
                                 :avatar,
                                 :industry_id)
      .merge!({:user_id => user.id})
  end

  def rss params
    params.require(:rss).permit(:sitename, 
                                 :url, 
                                 :domain_id,
                                 :industry_id)
  end

  def domain params
    params.require(:domain).permit(:name)
  end

  def industry params
    params.require(:industry).permit(:name)
  end
end
