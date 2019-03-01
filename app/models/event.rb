class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :invitations
  has_many :invitations, foreign_key: "attended_event_id"
end
