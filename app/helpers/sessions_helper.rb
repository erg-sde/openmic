module SessionsHelper

# Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

# Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
# Returns true if the user is logged in, false otherwise.
   def logged_in?
     !current_user.nil?
   end

   def log_out
    session.delete(:user_id)
    @current_user = nil
  end
#################
# VENUE METHODS
###
###
  def venue_log_in(user)
    session[:venue_id] = user.id
  end

# Returns the current logged-in user (if any).
  def current_venue
    @current_venue ||= Venue.find_by(id: session[:venue_id])
  end
# Returns true if the user is logged in, false otherwise.
   def venue_logged_in?
     !current_venue.nil?
   end

   def venue_log_out
    session.delete(:venue_id)
    @current_venue = nil
  end
end
