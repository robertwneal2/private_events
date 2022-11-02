class Event < ApplicationRecord
  validates :name, :location, :date, presence: true

  belongs_to :creator, class_name: "User", foreign_key: :user_id
end
