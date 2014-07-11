class View < ActiveRecord::Base
  
  belongs_to :post
  belongs_to :enterprise
  belongs_to :product
  belongs_to :user
  belongs_to :technology
end
