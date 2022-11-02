class CreateEventAttendeesTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :events, :users, table_name: :event_attendees do |t|
      t.index :event_id
      t.index :user_id
      t.timestamps
    end
  end
end
