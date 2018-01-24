class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :answer
      t.refrence :Question
      t.reference :Ticket

      t.timestamps
    end
  end
end
