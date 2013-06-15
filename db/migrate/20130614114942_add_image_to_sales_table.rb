class AddImageToSalesTable < ActiveRecord::Migration
  def change
  	add_column :sales, :img_url, :string
  end
end
