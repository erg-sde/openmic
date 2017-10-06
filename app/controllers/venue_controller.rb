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
        # This should eventually link to the event show page.
        redirect_to @venue
      else
        render 'new'
      end
    end

    private

     def venue_params
       params.require(:venue).permit(:name, :email, :password,
                                    :password_confirmation)
     end

end
