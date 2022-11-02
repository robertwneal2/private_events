class Event < ApplicationRecord
  validates :name, :location, :date, presence: true

  belongs_to :creator, class_name: "User", foreign_key: :user_id

  has_many :event_attendees, foreign_key: :event_id
  has_many :attendees, through: :event_attendees, source: :user, dependent: :destroy
  
  # def self.past
  #   past_events = []
  #   all_events = Event.all
  #   all_events.each do |event|
  #     past_events << event if event.date < Time.now
  #   end
  #   return past_events
  # end

  # def self.upcoming
  #   upcoming_events = []
  #   all_events = Event.all
  #   all_events.each do |event|
  #     upcoming_events << event if event.date >= Time.now
  #   end
  #   return upcoming_events
  # end

  scope :past, -> { where("date < ?", Time.now)}
  scope :upcoming, -> { where("date >= ?", Time.now)}

end
