class Ticket < ApplicationRecord
  has_many :activities, through: :attendance
  has_many :questions, through: :answer
  belongs_to :ticket_type
  validate :ticket_type_must_be_available, on: :create

  def ticket_type_must_be_available
    if ticket_type.tickets.count >= ticket_type.max_tickets
      errors.add(:ticket_type, "No hay boletos de ese tipo disponibles.")
    end
  end

  def self.create_reference
    source = ("A".."Z").to_a + (0..9).to_a
    begin
      key=""
      5.times{ key += source[rand(source.size)].to_s }
    end while Ticket.exists?(reference: key)
    key
  end

  def self.create_badgeNumber
    source = (0..9).to_a
    begin
      key=""
      12.times{ key += source[rand(source.size)].to_s }
    end while Ticket.exists?(badgeNumber: key)
    key
  end

  def create_rollNumber
    rol = ticket_type.tickets.order(:rollNumber).pluck(:rollNumber).last
    if rol
      key = rol + 1
    else
      key = 1
    end
  end

end
