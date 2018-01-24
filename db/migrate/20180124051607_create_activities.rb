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
      t.references :event, foreign_key: true
      t.references :activity_type, foreign_key: true

      t.timestamps
    end
  end
end
