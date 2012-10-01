class CreateProductValues < ActiveRecord::Migration
  def change
    create_table :product_values do |t|
      t.integer :product_id
      t.integer :value_id

      t.timestamps
    end
  end
end
