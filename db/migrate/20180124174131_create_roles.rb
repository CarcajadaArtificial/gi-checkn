class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :role
      t.reference :Event
      t.reference :User

      t.timestamps
    end
  end
end
