class Contract < ActiveRecord::Base
  validates :contract_price, :numericality => {:only_integer => true}
  belongs_to :buy_order, :foreign_key => "buy_order_id", :class_name => "Order"
  belongs_to :sell_order, :foreign_key => "sell_order_id", :class_name => "Order"
end
