class CreateTicketTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_types do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
