class Activity < ApplicationRecord
  belongs_to :Event
  belongs_to :TicketType
end
