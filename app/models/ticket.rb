class Ticket < ApplicationRecord
  has_many :activities, through: :attendance
  has_many :questions, through: :answer
  belongs_to :ticket_type
end
