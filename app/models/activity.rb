class Activity < ApplicationRecord
  belongs_to :event
  belongs_to :activity_type
  has_many :single_access
  has_many :attendance
  has_many :ticket_types, through: :single_access
  has_many :tickets, through: :attendance
end
