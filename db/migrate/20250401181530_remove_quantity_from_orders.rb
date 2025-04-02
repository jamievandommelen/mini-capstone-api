class RemoveQuantityFromOrders < ActiveRecord::Migration[8.0]
  def change
    remove_column :orders, :quantity, :integer
  end
end
