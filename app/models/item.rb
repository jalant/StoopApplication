class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :sale_id
  belongs_to :sale
end
