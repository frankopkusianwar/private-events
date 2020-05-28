class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new

    @attendance.user_id = params[:user]
    @attendance.event_id = params[:event]
    @attendance.save
    redirect_to attendances_path
  end

  def index
    @attended = Attendance.all
    @eventpast = Event.prev_events
    @eventfut = Event.upcoming_events
  end
end
