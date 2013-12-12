class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
     if @order.save
      flash[:notice] = "order was saved!"
      redirect_to @order
     else
      flash[:error] = "order wasn't saved."
      render :new
    end
  end

  def update
  end

  def edit
  end

  private
  def order_params
    params.require(:order).permit(:quantity, :book_price, :order_type)
  end
end
