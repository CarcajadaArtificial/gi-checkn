class TicketType < ApplicationRecord
  has_many :activities, through: :single_access
  has_many :activity_types, through: :multiple_access
end
