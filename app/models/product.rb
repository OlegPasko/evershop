class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title
  
  validates_presence_of :description, :price, :title
  validates_uniqueness_of :title
  validates :price, numericality: {greater_than_or_equal_to: 0}
end
