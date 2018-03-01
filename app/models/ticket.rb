class Ticket < ApplicationRecord
  has_many :attendance
  has_many :activities, through: :attendance
  has_many :questions, through: :answer
  belongs_to :ticket_type
  has_one :event, through: :ticket_type
  validate :activities_must_be_available, on: :update
  #validate :ticket_type_must_be_available, on: :create

  def activities_must_be_available
    if activities.any?
      activities.each do |a|
        if a.tickets.count > a.capacity && a.capacity > 0
          errors[:base] << "Lo sentimos, uno de las actividades que elegiste está llena."
        end
      end
    end
  end

  def ticket_type_must_be_available
    if ticket_type.tickets.count >= ticket_type.max_tickets
      errors.add(:ticket_type, "No hay boletos de ese tipo disponibles.")
    end
  end

  def self.create_tickets(event)
    a = 1
    event.max_tickets.times{
      ticket = Ticket.new
      ticket.status = "new"
      ticket.ticket_type = TicketType.where(event_id: event.id, status: "default").first
      ticket.reference = create_reference
      ticket.badgeNumber = create_badgeNumber
      ticket.rollNumber = a
      ticket.save
      a = a + 1
    }
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

  def self.register(code, activity_id, event_id)
    if code.length > 5
      ticket = Ticket.find_by(badgeNumber: code)
    else
      ticket = Ticket.find_by(reference: code)
    end
    if ticket
      activity = Activity.find(activity_id)
      event = Event.find(event_id)
      if activity.activity_type.public
        Attendance.create(activity: activity, ticket: ticket, attended: true)
        return ticket, "success"
      else
        if ticket.activities.exists?(activity.id)
          Attendance.where(activity: activity, ticket: ticket).update(attended: true)
          return ticket, "success"
        else
          return ticket, "not_authorized"
        end
      end
    else
      return ticket, "not_found"
    end
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
