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
    @event.save
    @event.invite_action(params[:invitedlist], params[:user_now_id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
