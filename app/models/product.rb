class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title
  
  validates_presence_of :description, :price, :title
  validates_uniqueness_of :title
  validates :price, numericality: {greater_than_or_equal_to: 0}
  
  scope :recent, order("created_at DESC")
  
  has_many :product_values
  has_many :values, :through => :product_values
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
