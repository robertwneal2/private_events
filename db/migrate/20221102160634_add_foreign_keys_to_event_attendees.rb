class AddForeignKeysToEventAttendees < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :event_attendees, :users
    add_foreign_key :event_attendees, :events
  end
end
