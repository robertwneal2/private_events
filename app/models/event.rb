class Event < ApplicationRecord
  validates :name, :location, :date, presence: true

  belongs_to :creator, class_name: "User", foreign_key: :user_id

  has_many :event_attendees, foreign_key: :event_id
  has_many :attendees, through: :event_attendees, source: :user
end
