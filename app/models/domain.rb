class Domain < ActiveRecord::Base
  validates :name, presence: true, :uniqueness => true, :length => { :in => 1..5 }
  has_many :posts

  self.per_page = 7
end
