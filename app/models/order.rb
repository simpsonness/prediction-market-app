class Order < ActiveRecord::Base

  validates :quantity, :book_price, :numericality => {:only_integer => true}
  validates :option_type, presence: true
  belongs_to :user
  belongs_to :event

  def save_or_create_contract
    if self.first_match
      self.id = Order.last.id + 1
      self.save_as_contract
      return "Contract"
    else
      puts "*************** no first_match ********************************"
      self.save
      return "Order"
    end
  end  

  def first_match
    if self.option_type == "sell"
      # look for a buy with the same price
      match = Order.where(:book_price => self.book_price, :option_type => "buy").first
    else
      # else, look for a sell with the same price...
      match = Order.where(:book_price => self.book_price, :option_type => "sell").first
    end 
    return match   
  end

  def save_as_contract
    contract = Contract.new
    contract.contract_price = self.book_price
    if self.option_type == "buy"
      contract.buy_order_id = self.id
      contract.sell_order_id = first_match.id
    else
      contract.buy_order_id = first_match.id
      contract.sell_order_id = self.id
    end      
    contract.save
    return
  end

end