class WelcomeController < ApplicationController
  def index
    @events = Event.all
  end
end
