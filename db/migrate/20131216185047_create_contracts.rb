class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :price
      t.integer :order_id

      t.timestamps
    end
  end
end
