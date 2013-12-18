class EventsController < ApplicationController
  before_filter :require_login
  before_filter :find_event, :only => [:edit, :update, :destroy]
  before_filter :make_sure_owner, :only => [:edit, :update, :destroy]
  

  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Event was saved!"
      redirect_to @event
    else
      flash[:error] = "Event wasn't saved."
      render :new
    end
  end

  def edit

    

  end


  def update

    if  @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :price, :sell_price, :avatar, :start_time, :end_time)
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def make_sure_owner
    if current_user != @event.owner
       redirect_to events_path
    end
  end

end
