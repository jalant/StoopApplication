class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :sale_id
  belongs_to :sale
  
  validates_numericality_of :price, :less_than => 4294967296
end