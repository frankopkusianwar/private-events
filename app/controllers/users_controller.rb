class UsersController < ApplicationController
  def show
    @events = current_user.events
    @past_events = current_user.events.prev_events
    @upcoming_events = Invitation.where(invitee: current_user)
    @all_events = current_user.check_events(@upcoming_events)
    @coming = current_user.coming_events(@all_events)
    @prev = current_user.prev_events(@all_events)
  end
end
