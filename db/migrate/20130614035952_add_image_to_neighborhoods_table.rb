class AddImageToNeighborhoodsTable < ActiveRecord::Migration
  def change
  	add_column :neighborhoods, :img_url, :string
  end
end

