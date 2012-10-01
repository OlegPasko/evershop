class ProductValue < ActiveRecord::Base
  attr_accessible :product_id, :value_id
  
  validates_presence_of :product_id, :value_id
  
  belongs_to :product
  belongs_to :value
end
