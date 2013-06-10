class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :title
      t.text :address
      t.string :city
      t.string :date
      t.string :time
      t.integer :user_id

      t.timestamps
    end
  end
end
