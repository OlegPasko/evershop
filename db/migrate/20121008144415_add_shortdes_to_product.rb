class AddShortdesToProduct < ActiveRecord::Migration
  def change
    add_column :products, :shortdescription, :string
  end
end
