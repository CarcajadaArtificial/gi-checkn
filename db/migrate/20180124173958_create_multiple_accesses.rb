class CreateMultipleAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :multiple_accesses do |t|
      t.integer :amount
      t.references :ticket_type, foreign_key: true
      t.references :activity_type, foreign_key: true

      t.timestamps
    end
  end
end
