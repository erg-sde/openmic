class UserEventsController < ApplicationController

  def new
    @user_event = UserEvent.new
  end

  def create
    @user_event = UserEvent.new(event: params[:id], user: current_user)
    if @user_event.save
      flash[:success] = "You signed up!"
      redirect_to current_user
    else
      render 'index'
    end
  end




end
