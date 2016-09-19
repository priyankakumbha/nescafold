class Product < ActiveRecord::Base
  belongs_to :shop
  
  has_many :line_items
  has_many :orders, :through => :line_items

end
