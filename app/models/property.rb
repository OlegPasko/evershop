class Property < ActiveRecord::Base
  attr_accessible :name, :sort
  
  has_many :values
  
  validates_presence_of :name, :sort
end
