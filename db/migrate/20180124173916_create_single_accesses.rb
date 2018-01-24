class CreateSingleAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :single_accesses do |t|
      t.references :ticket_type
      t.references :activity

      t.timestamps
    end
  end
end
