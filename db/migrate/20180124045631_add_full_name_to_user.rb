class AddFullNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fullName, :string
  end
end
