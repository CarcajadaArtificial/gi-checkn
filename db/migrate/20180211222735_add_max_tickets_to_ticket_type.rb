class AddMaxTicketsToTicketType < ActiveRecord::Migration[5.1]
  def change
    add_column :ticket_types, :max_tickets, :integer
  end
end
