class SignUpsController < ApplicationController
  def create

    @sign_up = SignUp.new

    @sign_up.User_id = params[:user]
    @sign_up.Event_id = params[:event]
    @sign_up.save
    redirect_to event_path(@sign_up.Event_id)
  end
end