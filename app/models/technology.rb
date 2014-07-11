class Technology < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/technology/missing.png"

  validates :name, presence: true, :length => { :in => 1..10}
  validates :address, presence: true
  validates :phone, presence: true, :numericality => true,:length => { :in => 1..15 }
  validates :introduction, presence: true, :length => { :maximum => 100 }
  validates :url, presence: true
  validates :email, confirmation: true, presence: true
  validates :services, :presence => true

  has_many   :views

  scoped_search :on => [:name, :address, :introduction, :services ]

  self.per_page = 3
end
