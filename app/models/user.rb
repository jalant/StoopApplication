class User < ActiveRecord::Base
  attr_accessible :email, :neighborhood_id, :password, :username
end
