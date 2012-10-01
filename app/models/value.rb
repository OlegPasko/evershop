class Value < ActiveRecord::Base
  attr_accessible :fav, :property_id, :value
  
  validates_presence_of :property_id, :value
  
  belongs_to :property
  has_many :product_values
  has_many :products, :through => :product_values
  
  scope :fav, where(fav: true)
  scope :sorted, order("sort asc")
  
  def to_param
    "#{id}-#{value.parameterize}"
  end
end
