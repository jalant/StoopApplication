class User < ActiveRecord::Base
  attr_accessible :email, :neighborhood_id, :password, :username
  belongs_to :neighborhood
  has_many :sales
  has_many :items, through: :sales
end
