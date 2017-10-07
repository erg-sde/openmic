module UserEventsHelper

  def add_event
    event = Event.find_by(params[:id])
    user = session[:user_id]
    userevent = UserEvent.new(user_id: user, event_id: event)
    flash[:success] = "You signed up!"
  end
end
