class Rss < ActiveRecord::Base
  validates :sitename, presence: true, :length => { :in => 1..10 }
  validates :url, :confirmation => true, presence: true, :uniqueness => true
  belongs_to :domain
  belongs_to :industry
  
  scope :domains, -> { where("domain_id IS NOT NULL") }
  scope :industries, -> { where("industry_id IS NOT NULL") }

  self.per_page = 7
end
