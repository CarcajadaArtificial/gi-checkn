class AddStatusToTicketType < ActiveRecord::Migration[5.1]
  def change
    add_column :ticket_types, :status, :string
  end
end
