class TicketType < ApplicationRecord
  belongs_to :event
  has_many :activities, through: :single_access
  has_many :single_access
  has_many :questions
  has_many :tickets
  has_many :activity_types, through: :multiple_access
end
