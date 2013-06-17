class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :sale_id, :image
  belongs_to :sale
  
  validates_numericality_of :price, :less_than => 4294967296
  validates_numericality_of :price, :greater_than_or_equal_to => 0 
end

