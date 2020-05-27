class WelcomeController < ApplicationController
  def index
    @events = Event.order(:date)
  end
end
