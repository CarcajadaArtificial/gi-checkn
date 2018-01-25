class ActivityType < ApplicationRecord
  has_many :ticket_types, through: :multiple_access
  has_many :activities
end
