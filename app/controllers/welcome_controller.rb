class WelcomeController < ApplicationController
  def index
    @events = Event.order(:date)
    @past_events = Event.prev_events
    @upcoming_events = Event.upcoming_events
  end
end
