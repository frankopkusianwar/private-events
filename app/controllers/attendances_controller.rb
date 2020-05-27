class AttendancesController < ApplicationController
  def create

    @attendance = Attendance.new

    @attendance.user_id = params[:user]
    @attendance.event_id = params[:event]
    @attendance.save
    redirect_to event_path(@attendance.Event_id)
  end
end