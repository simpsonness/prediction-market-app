class OptionsController < ApplicationController
  def index
    @option = Option.all
  end

  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
     if @option.save
      flash[:notice] = "Option was saved!"
      redirect_to @option
     else
      flash[:error] = "Option wasn't saved."
      render :new
    end
  end

  def update
  end

  def edit
  end

  private
  def option_params
    params.require(:option).permit(:quantity, :book_price, :option_type)
  end
end
