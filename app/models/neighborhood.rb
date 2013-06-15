# == Schema Information
#
# Table name: neighborhoods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Neighborhood < ActiveRecord::Base
	
  attr_accessible :name, :img_url

  has_many :users
  has_many :sales, through: :users

end
