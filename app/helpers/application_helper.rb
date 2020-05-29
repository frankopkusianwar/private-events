module ApplicationHelper
  def accept_invitation
    if current_user.check_invited?(@event) && @event.creator != current_user
      render 'events/accepinv'
    end
  end

  def invite_user(user, event)
    if !user.check_invited?(event) && @event.creator == current_user
      render "events/invite", user: user, event: event
    end
  end

end
