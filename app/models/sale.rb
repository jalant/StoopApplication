class Sale < ActiveRecord::Base
  attr_accessible :address, :city, :date, :time, :title, :user_id
  has_many :items
  belongs_to :user
end
