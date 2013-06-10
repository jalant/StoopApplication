ActiveRecord::Schema.define(:version => 20130610220444) do

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "description"
    t.integer  "sale_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sales", :force => true do |t|
    t.string   "title"
    t.text     "address"
    t.string   "city"
    t.string   "date"
    t.string   "time"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.integer  "neighborhood_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end