class Enterprise < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/enterprises/missing.png"
  validates_attachment_content_type :avatar,:content_type =>%w{image/jpeg image/jpg image/png}

  validates :name, presence: true, :length => { :in => 1..15}
  validates :address, presence: true
  validates :phone, presence: true, :numericality => true,:length => { :in => 1..15 }
  validates :description, presence: true, :length => { :maximum => 100 }
  #validates :url, presence: true
  #validates :email, confirmation: true, presence: true
  validates :industry_id, :presence => true

  belongs_to :industry
  has_many   :views
  has_many   :products

  scoped_search :on => [:name, :address, :description ]

  self.per_page = 3
end
