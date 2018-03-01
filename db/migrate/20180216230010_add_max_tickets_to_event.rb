class AddMaxTicketsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :max_tickets, :integer
  end
end
