class AddImageToItem < ActiveRecord::Migration
  def change
    add_column :items, :image, :text
  end
end
