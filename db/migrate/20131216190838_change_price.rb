class ChangePrice < ActiveRecord::Migration
  def change 
    rename_column :contracts, :price, :contract_price

  end
  end
