class Event < ActiveRecord::Base

  def current_buy_price
    # Calculate buy price from option model activity
    # The following is just a pseudo-code case example of how it could be calculated
    price = 1.00
    # case number_of_unique_buyers
    # when between 10 and 20
    #   price * 1.2
    # when between 20 and 30 
    #   price * 1.4
    # else 
    #   price * 1
    # end
    return price
  end

  def current_sell_price
    # Calculate buy price from option model activity
    return 1.00
  end

  def number_of_unique_buyers
  end

end
