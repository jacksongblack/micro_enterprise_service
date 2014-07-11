class Industry < ActiveRecord::Base
  validates :name, presence: true, :uniqueness => true, :length => { :in => 1..5 }

  has_many :posts
  has_many :enterprises
  has_many :products

  self.per_page = 7
end
