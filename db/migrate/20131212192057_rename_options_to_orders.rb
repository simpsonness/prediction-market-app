class RenameOptionsToOrders < ActiveRecord::Migration
  def change
    rename_table :options, :orders
  end
end
