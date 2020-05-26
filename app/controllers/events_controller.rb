class EventsController < ApplicationController
  def show
    @event = event.find(params: [:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creators << current_user
    @event.save
    @event.invite_action(params[:invitedlist])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
