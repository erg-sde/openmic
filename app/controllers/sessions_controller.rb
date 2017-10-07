class SessionsController < ApplicationController
  def new
  end

  def create
    if auth = request.env["omniauth.auth"]
      provider = auth[:provider]
      if provider == "google_oauth2"
        user = User.find_by(google_id: auth['uid']) || User.create_from_google(auth)
        log_in user
        redirect_to user
      elsif provider == "facebook"
        user = User.find_by(facebook_id: auth['uid']) || User.create_from_facebook(auth)
        log_in user
        redirect_to user
      else
        flash[:danger] = 'wrong provider'
        render 'new'
      end
    else
      flash[:danger] = 'something wrong'
      render 'new'
    end
  end

  def create_venue
    if venue = Venue.find_by(email: params[:session][:email].downcase)
      venue && venue.authenticate(params[:session][:password])
      venue_log_in venue
      redirect_to venue
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
    # else
    #
    #   else
    #     user = User.find_by(email: params[:session][:email].downcase)
    #     if user && user.authenticate(params[:session][:password])
    #       log_in user
    #       redirect_to user
    #     else
    #       flash[:danger] = 'Invalid email/password combination'
    #
    #render 'new'
    # end #old code for user model

  def destroy
    log_out
    venue_log_out
    redirect_to root_url
  end
end
