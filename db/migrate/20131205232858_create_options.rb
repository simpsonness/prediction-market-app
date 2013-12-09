class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :quantity
      t.integer :book_price
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
