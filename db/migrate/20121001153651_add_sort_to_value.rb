class AddSortToValue < ActiveRecord::Migration
  def change
    add_column :values, :sort, :integer, :default => 10
  end
end
