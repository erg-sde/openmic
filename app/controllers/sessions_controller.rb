class SessionsController < ApplicationController
  def new
  end



  def create
    if auth = request.env["omniauth.auth"]
      user = User.find_by(google_id: auth['uid']) || User.create_from_google(auth)
      log_in user
      redirect_to user
    else
      if params[:venue] = 1
        venue = Venue.find_by(email: params[:session][:email].downcase)
        if venue && venue.authenticate(params[:session][:password])
        venue_log_in venue
        redirect_to venue
        else
        flash[:danger] = 'Invalid email/password combination'
        render 'new'
        end
      else
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in user
          redirect_to user
        else
          flash[:danger] = 'Invalid email/password combination'
          render 'new'
        end
      end
    end
  end

  def destroy
    log_out
    venue_log_out
    redirect_to root_url
  end

end
