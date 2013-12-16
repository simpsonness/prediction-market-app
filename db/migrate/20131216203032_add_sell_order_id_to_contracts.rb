class AddSellOrderIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :sell_order_id, :integer
    rename_column :contracts, :order_id, :buy_order_id
  end
end
