class User < ActiveRecord::Base
  attr_accessible :email, :neighborhood_id, :password, :username, :admin
  belongs_to :neighborhood 
  has_many :sales
  has_many :items, through: :sales
  has_secure_password

	validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true, :length => { :in => 6..20 }
end



