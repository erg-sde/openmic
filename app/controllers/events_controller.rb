class EventsController < ApplicationController

    def new
      @event = Event.new
    end


  def show
     @event = Event.find(params[:id])
     @user_events = UserEvent.where(event_id: @event.id)

     if @event.user_events.any? {|user_event| user_event.user = current_user}
       @userevent = UserEvent.find_by(["user_id = ? and event_id = ?", session[:user_id], @event.id])
      #  @arrived = !@userevent.arrival.nil?
     end
  end

  def index
    @events = Event.all

    @results = Event.search(params[:search])
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

  def sort
    params[:order].each do |key,value|
      UserEvent.find(value[:id]).update_attribute(:order,value[:position])
    end
    render :nothing => true
  end

  private

  def event_params
    params.require(:event).permit(:name, :start, :end)
  end

end
