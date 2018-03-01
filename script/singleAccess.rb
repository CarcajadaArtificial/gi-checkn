tickets = Ticket.where(event_id: 2)
tickets.each do |ticket|
  ticket.ticket_type.single_access.each do |single_access|
    Attendance.create(ticket_id: ticket.id, activity_id: single_access.activity_id)
  end
end
