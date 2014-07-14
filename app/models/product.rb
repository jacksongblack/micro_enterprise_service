class Product < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/products/missing.png"

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :name, presence: true, :length => { :in => 1..15}
  validates :price,  presence: true, :length => { :in => 1..8}
  validates :description, presence: true
  validates :industry_id, :presence => true
  validates :enterprise_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :industry
  belongs_to :enterprise
  belongs_to :user
  has_many   :views

  scoped_search :on => [:name, :description]
end
