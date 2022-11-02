class EventAttendeesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @event_attendees = EventAttendee.all
  end

  def create
    @event = Event.find(params[:event_id])
    current_user.attended_events << @event
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.attended_events.destroy(@event)
    redirect_to @event
  end

end