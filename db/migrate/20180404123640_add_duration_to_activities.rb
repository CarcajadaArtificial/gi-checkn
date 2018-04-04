class AddDurationToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :duration, :integer
  end
end
