class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :sale_id
end
