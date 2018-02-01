class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :reference
      t.string :badgeNumber
      t.string :email
      t.string :fullName
      t.boolean :sex
      t.string :state
      t.references :ticket_type, foreign_key: true
      t.timestamps
    end
  end
end
