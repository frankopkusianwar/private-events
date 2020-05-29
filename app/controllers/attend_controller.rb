class AttendController < ApplicationController
  def create
    byebug
    inv = Invitation.find_by(invitee_id: current_user.id, event_id: params[:event])
    inv.status = true
    redirect_to root_path
  end
end