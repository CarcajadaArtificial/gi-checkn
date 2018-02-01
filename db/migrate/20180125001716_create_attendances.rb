class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.boolean :attended
      t.references :ticket, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
