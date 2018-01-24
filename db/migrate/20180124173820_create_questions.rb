class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :sentence
      t.reference :TicketType

      t.timestamps
    end
  end
end
