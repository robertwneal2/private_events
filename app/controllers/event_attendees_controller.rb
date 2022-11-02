class EventAttendeesController < ApplicationController
  def index
    @event_attendees = EventAttendee.all
  end
end