class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new
    @invitation.invitor_id = params[:invitator]
    @invitation.invitee_id = params[:invitee]
    @invitation.event_id = params[:event]
    @invitation.save
    redirect_to event_path(@invitation.event_id)
  end

  def invitation_params
    params.require(:invitation).permit(:invitor, :invitee, :event)
  end
end
