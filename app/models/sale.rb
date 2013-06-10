class Sale < ActiveRecord::Base
  attr_accessible :address, :city, :date, :time, :title, :user_id
end
