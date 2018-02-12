class Event < ApplicationRecord
  # Model relations.
  has_many :users, through: :roles
  has_many :activities
  has_many :ticket_types
  has_many :questions, through: :ticket_types
  # Legible url and find override.
  validates_uniqueness_of :urlName
  def to_param
    urlName
  end
  def self.find(input)
    if input.to_i != 0
      super
    else
      find_by_urlName(input)
    end
  end

  def activities_by_day
    acts = activities.order(:date)
    dates = acts.pluck(:date)
    day_count = dates.last.day - dates.first.day + 1
    day = dates.first
    activities_by_day = []
    for i in 0..day_count - 1
      activities_by_day[i] = acts.select{|act| act["date"] == day}
      day = day.next
    end
    activities_by_day
  end

  def available_ticket_types
    available_ticket_types =[]
    ticket_types.each do |tt|
      ticket_count = Ticket.where(ticket_type: tt).count
      available_ticket_types.push(tt) unless ticket_count>= tt.max_tickets
    end
    available_ticket_types
  end

end
