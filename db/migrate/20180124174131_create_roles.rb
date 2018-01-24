class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :role
      t.references :event
      t.references :user

      t.timestamps
    end
  end
end
