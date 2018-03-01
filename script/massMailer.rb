# open("script/vendidos") do |vendidos|
#    vendidos.read.each_line do |data|
#      ticket = Ticket.where(ticket_type_id: 4).first
#      name, email, ticket_type_id = data.chomp.split("###")
#      ticket.fullName = name
#      ticket.email = email
#      ticket.ticket_type_id = ticket_type_id
#      ticket.status = "sold"
#      ticket.rollNumber = ticket.create_rollNumber
#      ticket.save
#      puts ticket.email
#      TicketMailer.sale_email(ticket).deliver_now
#    end
# end
# tickets = Event.find(2).tickets.where(status: "sold")
# tickets.each do |ticket|
#   TicketMailer.sale_email(ticket).deliver_now
# end
tickets = Event.find(2).tickets
tickets.each do |ticket|
  TicketMailer.reminder_email(ticket).deliver_now
end
