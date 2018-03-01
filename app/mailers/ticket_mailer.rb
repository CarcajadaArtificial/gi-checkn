class TicketMailer < ApplicationMailer
  default from: 'no-reply@checkn.mx'
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/png_outputter'

  def sale_email(ticket)
    @ticket = ticket
    barcode = Barby::Code128B.new(ticket.badgeNumber)
    png = Barby::PngOutputter.new(barcode).to_png(margin:0, height: 200, xdim: 3)
    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    asunto = "¡Tu boleto para #{ticket.event.name} te espera!"
    mail(to: ticket.email, subject: asunto)
  end

  def reminder_email(ticket)
    @ticket = ticket
    barcode = Barby::Code128B.new(ticket.badgeNumber)
    png = Barby::PngOutputter.new(barcode).to_png(margin:0, height: 200, xdim: 3)
    attachments.inline["barcode.png"] = png
    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    if [5, 7, 8, 10, 15, 16].include?(@ticket.ticket_type_id)
      attachments["visitas.jpg"] = File.read("#{Rails.root}/app/assets/images/visitas.jpg")
    end
    @activities = ticket.activities.select {|activity| activity.activity_type.public != true }.sort_by(&:name)
    asunto = "¡Te esperamos mañana en el #{ticket.event.name}!"
    mail(to: ticket.email, subject: asunto)
  end

  def preregister_email(ticket)
    @ticket = ticket
    barcode = Barby::Code128B.new(ticket.badgeNumber)
    png = Barby::PngOutputter.new(barcode).to_png(margin:0, height: 200, xdim: 3)
    attachments.inline["barcode.png"] = png
    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    if [5, 7, 8, 10, 15, 16].include?(@ticket.ticket_type_id)
      attachments["visitas.jpg"] = File.read("#{Rails.root}/app/assets/images/visitas.jpg")
    end
    @activities = ticket.activities.select {|activity| activity.activity_type.public != true }.sort_by(&:name)
    asunto = "¡Gracias por inscribirte a #{ticket.event.name}!"
    mail(to: ticket.email, subject: asunto)
  end
end
