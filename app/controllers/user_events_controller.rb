class UserEventsController < ApplicationController

  def new
    @user_event = UserEvent.new
  end

  def create
    @user_event = UserEvent.new(event_id: params[:event_id], user_id: current_user.id)


    if @user_event.save
      flash[:success] = "You signed up!"
      redirect_back fallback_location: current_user
    else
      redirect_to events_path
    end
  end



end
