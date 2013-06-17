class Sale < ActiveRecord::Base
  attr_accessible :address, :city, :date, :time, :title, :user_id, :items_attributes, :neighborhood_id, :img_url
  has_many :items
  belongs_to :user
  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:content].blank? }

  validates :address, presence: true
  validates :city, presence: true
  validates :time, presence: true
  validates :title, presence: true

end
