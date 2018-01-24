class CreateMultipleAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :multiple_accesses do |t|
      t.integer :amount
      t.references :ticket_type
      t.references :activity_type

      t.timestamps
    end
  end
end
