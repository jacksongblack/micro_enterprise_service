class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :enterprise
  has_many :posts

  def create_enterprise enterprise
    update(enterprise_id: enterprise.id)
  end

  def can_write? object
    has_role?(:admin) || eql?(object.user)
  end
end
