class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :title
  mount_uploader :image, ProductimageUploader

  
  validates_presence_of :description, :price, :title
  validates_uniqueness_of :title
  validates :price, numericality: {greater_than_or_equal_to: 0}
  
  scope :recent, order("created_at DESC")
  
  has_many :product_values
  has_many :values, :through => :product_values
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  private
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'line items exist')
      return false
    end
  end
end
