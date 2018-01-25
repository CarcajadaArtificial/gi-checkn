class Activity < ApplicationRecord
  belongs_to :Event
  belongs_to :ActivityType
  has_many :ticket_types, through: :single_access
  has_many :tickets, through: :attendance
end
