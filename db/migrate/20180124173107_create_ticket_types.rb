class CreateTicketTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_types do |t|
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
