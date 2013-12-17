class OrdersController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @orders = @event.orders

  end

  def new
    @order = Order.new

  end

  def create
    @order = current_user.orders.build(order_params)
    @order.quantity = 1
    @order.event_id = params[:event_id]

    # @order = Order.new(order_params)
    # @order.user = current_user
     if type = @order.save_or_create_contract
      if type == "Order" 
        flash[:notice] = "order was saved!"
        redirect_to event_order_path(@order.event, @order)
      elsif type =="Contract"
        redirect_to event_orders_path
      end
     else
      flash[:error] = "order wasn't saved."
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @event = @order.event
    @user = @order.user
    @book_price = @order.book_price

    # if @order.save
    #   redirect_to order_path, notice: 'Order successfully'
    # else
    #   render :action => :show
    # end
  end

  def update
  end

  def edit
  end

  private
  def order_params
    params.require(:order).permit(:quantity, :book_price, :option_type)
  end

  
end
