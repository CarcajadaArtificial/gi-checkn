class Question < ApplicationRecord
  belongs_to :ticket_type
  has_many :tickets, through: :answer
end
