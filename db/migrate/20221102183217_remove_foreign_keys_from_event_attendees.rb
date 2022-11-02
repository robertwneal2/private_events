class RemoveForeignKeysFromEventAttendees < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :event_attendees, :users
    remove_foreign_key :event_attendees, :events
  end
end
