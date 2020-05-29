module ApplicationHelper
  def accept_invitation
    render 'events/accepinv' if current_user.check_invited?(@event) && @event.creator != current_user
  end

  def invite_user(user, event)
    render 'events/invite', user: user, event: event if !user.check_invited?(event) && @event.creator == current_user
  end
end
