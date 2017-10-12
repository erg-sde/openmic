class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
     @user = User.find(params[:id])
     @user_events = UserEvent.where(user_id: @user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Open Mic"
      # This should eventually link to the event show page.
      redirect_to @user
    else
      render 'new'
    end
  end

  def check_in
    @event = Event.find(params[:event_id])
    @distance =  @event.venue.distance_to( [params[:lat].to_f, params[:long].to_f])
    @userevent = UserEvent.where(["user_id = ? and event_id = ?", session[:user_id], @event.id])
    if !@userevent.nil? && @distance > 0
      @userevent.update(arrival: Time.now)
      flash[:success] = "a value was returned"
      redirect_back fallback_location: current_user
    else
      flash[:danger] = 'Looks like you have yet to arrive'
      redirect_back fallback_location: current_user
    end
  end

  private

 def user_params
   params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
 end

end
