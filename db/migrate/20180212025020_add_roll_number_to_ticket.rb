class AddRollNumberToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :rollNumber, :integer
  end
end
