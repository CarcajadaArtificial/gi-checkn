class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.date :date
      t.time :time
      t.string :location
      t.string :host
      t.integer :capacity
      t.integer :overAttendance
      t.references :Event, foreign_key: true
      t.references :TicketType, foreign_key: true

      t.timestamps
    end
  end
end
