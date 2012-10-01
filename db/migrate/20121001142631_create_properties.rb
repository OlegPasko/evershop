class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :sort, :default => 10

      t.timestamps
    end
  end
end
