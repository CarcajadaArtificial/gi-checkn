class CreateSingleAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :single_accesses do |t|
      t.Reference :TicketType
      t.reference :Activity

      t.timestamps
    end
  end
end
