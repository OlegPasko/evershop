class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone
  
  validates_presence_of :name, :phone
  has_many :line_items, :dependent => :destroy
  scope :recent, :limit => 100, :order => 'created_at DESC'
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
