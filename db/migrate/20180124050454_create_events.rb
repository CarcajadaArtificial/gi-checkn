class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :urlName
      t.date :startDate
      t.date :endDate
      t.string :imageUrl
      t.string :mainColor
      t.string :color2
      t.string :locationCode

      t.timestamps
    end
  end
end
