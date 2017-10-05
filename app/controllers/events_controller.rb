class EventsController < ApplicationController

    def new
      @event = Event.new
    end


  def show
     @event = Event.find(params[:event])
  end

  def create
    if venue_logged_in?
      @event = Event.new(event_params)
      @event.venue = params[:id]
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
