class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :property_id
      t.string :value
      t.boolean :fav, :default => false

      t.timestamps
    end
  end
end
