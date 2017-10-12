class EventsController < ApplicationController

    def new
      @event = Event.new
    end


  def show
     @event = Event.find(params[:id])
     @user_events = UserEvent.where(event_id: @event.id)
  end

  def index
    @events = Event.all
    # @searchevents = Event.search(params[:search])
  end


  def create
    if venue_logged_in?
      @event = Event.new(event_params)
      @event.venue_id = session[:venue_id]
      if @event.save
        flash[:success] = "Event Saved"
        # This should eventually link to the event show page.
        redirect_to @event
      else
        render 'new'
      end
    else
      redirect_to login_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start, :end)
  end

end
