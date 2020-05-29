class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @users = User.all
    @invitation = Invitation.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      user = User.find(params[:creator_id])
      invitation = Invitation.new
      invitation.status = true
      invitation.invitor = user
      invitation.invitee = user
      invitation.event = @event
      invitation.save
      redirect_to root_path
    else
      flash[:alert] = 'Invalid Parameters'
      render 'new'
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
