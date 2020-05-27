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
    @event = Event.new(event_params)
    if @event.save
      @event.invite_action(params[:invitedlist], params[:user_now_id])
      user = User.find(params[:creator_id])
      @event.creators << user
      invitation = Invitation.new
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
