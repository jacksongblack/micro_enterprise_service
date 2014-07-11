class Post < ActiveRecord::Base
  validates :title, presence: true, :length => { :in => 1..50 }
  validates :content, presence: true
  validates :description, presence: true, :length => { :in => 10..250 }
  validates :from, presence: true
  validates :logo, presence: true
  validates :user_id, :presence => true

  belongs_to :domain
  belongs_to :industry
  belongs_to :user
  has_many   :views

  acts_as_taggable 

  scope :from_domain, -> { where("domain_id IS NOT NULL") }
  scope :from_industry, -> { where("industry_id IS NOT NULL") }
  scope :has_image, -> { where("content LIKE '%img%' AND content LIKE '%src=%'") }

  scoped_search :on => [:title, :content, :description]

  self.per_page = 12
  
  def images
    content.scan(/\<img.*src\=\"([^"]*)/).flatten
  end
  
end
