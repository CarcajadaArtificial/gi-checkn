class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :sentence
      t.references :ticket_type, foreign_key: true

      t.timestamps
    end
  end
end
