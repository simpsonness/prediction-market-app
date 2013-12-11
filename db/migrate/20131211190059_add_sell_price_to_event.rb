class AddSellPriceToEvent < ActiveRecord::Migration
  def change
    add_column :events, :sell_price, :integer
  end
end
