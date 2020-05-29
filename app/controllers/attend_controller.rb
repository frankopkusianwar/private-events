class AttendController < ApplicationController
  def create
    inv = Invitation.find_by(invitee_id: current_user.id, event_id: params[:event])
    inv.status = true
    inv.save
    redirect_to root_path
  end
end

