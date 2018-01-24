class CreateMultipleAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :multiple_accesses do |t|
      t.integer :amount
      t.reference :TicketType
      t.reference :ActivityType

      t.timestamps
    end
  end
end
