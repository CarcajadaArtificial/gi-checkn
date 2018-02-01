class CreateSingleAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :single_accesses do |t|
      t.references :ticket_type, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
