class VenueController < ApplicationController

    def new
      @venue = Venue.new
    end

    def show
       @venue = Venue.find(params[:id])
       @events = Event.where(venue_id: @venue)
    end

    def create
      @venue = Venue.new(venue_params)
      if @venue.save
        flash[:success] = "Welcome to Open Mic Venues"
              redirect_to login_path
      else
        render 'new'
      end
    end

    private

     def venue_params
       params.require(:venue).permit(:name, :email, :password,
                                    :password_confirmation, :address)
     end

end
